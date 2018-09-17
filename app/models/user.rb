class User < ApplicationRecord
  before_save { self.avatar_url = https_url(avatar_url) }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :omniauthable

  def self.find_or_create_from_oauth(auth)
    User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.user_name = auth.info.nickname
      user.avatar_url = auth.info.image
      user.email      = User.dummy_email(auth)
      user.password   = Devise.friendly_token[0, 20]
    end
  end

  private

    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end

    def https_url(url)
      return url if url.nil?
      return url.gsub(/http:/, 'https:') if url.include?('http:')
      return url
    end
end
