class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:azure_oauth2]

  has_many :time_entries
  has_many :auth_providers, dependent: :destroy

  def self.from_omniauth(auth)
    User.joins(:auth_providers).where(auth_providers: {provider: auth.provider, uid: auth.uid}).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.auth_providers.push(
        AuthProvider.create( provider: auth.provider,
                            uid: auth.uid,
                            user_id: user
                           )
      )
    end
  end
end
