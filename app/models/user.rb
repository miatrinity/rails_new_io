class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable

  has_many :app_recipes

  before_create :set_api_token

  private

  def set_api_token
    self.api_token = generate_api_token
  end

  def generate_api_token
    loop do
      api_token = SecureRandom.base58(36)
      break api_token if User.find_by(api_token: api_token).blank?
    end
  end
end
