class PushRailsAppVerificationStep < AutomatedVerificationStep
  def command
    sleep 3
    # github = Github.new oauth_token: Rails.application.credentials.github[:personal_access_token]

    # begin
    #   github.repos.delete user: "miatrinity", repo: app_name
    # rescue Github::Error::NotFound
    #   puts "The repository miatrinity/#{app_name} doesn't exist"
    # end

    # github.repos.create name: app_name

    # TODO: optionally add file with verification_run_id

    # Rails.configuration.push_repo_command_template
    "echo 'I am pushing the MAJOMS to Github like now\! EPIC\! OMG\!'"
  end
end
