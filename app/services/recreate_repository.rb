class RecreateRepository
  def initialize(repo_name:, api_token:)
    @repo_name = repo_name
    @api_token = api_token
  end

  def perform
    delete_repo
    create_repo
    create_rails_new_io_token_repo_secret
  end

  private

  def delete_repo
    github_client.repos.delete user: "miatrinity", repo: @repo_name
  rescue Github::Error::NotFound
    puts "The repository miatrinity/#{@repo_name} doesn't exist"
  end

  def github_client
    @_github_client ||= Github.new oauth_token: Rails.application.credentials.github[:personal_access_token]
  end

  def create_repo
    github_client.repos.create name: @repo_name
  end

  def create_rails_new_io_token_repo_secret
    %x(curl -i -u miatrinity:#{Rails.application.credentials.github[:personal_access_token]}\
    -X PUT \
    -H 'Accept: application/vnd.github.v3+json' \
    https://api.github.com/repos/miatrinity/Tailwind/actions/secrets/RAILS_NEW_IO_TOKEN \
    -d '#{request_body}')
  end

  def request_body
    "{'key_id':'#{public_key_id}', 'encrypted_value':'#{base64_encrypted_secret}'}".tr("'", '"')
  end

  def public_key_id
    @_public_key_id ||= public_key_data.scan(/key_id": "(.+?)"/).flatten[0]
  end

  def public_key_data
    @_public_key_data ||= %x(curl -i -u miatrinity:#{Rails.application.credentials.github[:personal_access_token]} \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/miatrinity/Tailwind/actions/secrets/public-key)
  end

  def base64_encrypted_secret
    key = Base64.decode64(public_key)
    libsodium_public_key = RbNaCl::PublicKey.new(key)
    box = RbNaCl::Boxes::Sealed.from_public_key(libsodium_public_key)
    encrypted_secret = box.encrypt(@api_token)
    Base64.strict_encode64(encrypted_secret)
  end

  def public_key
    @_public_key ||= public_key_data.scan(/key": "(.+?)"/).flatten[0]
  end
end
