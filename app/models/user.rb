class User < ActiveRecord::Base
	has_many :foods
	has_many :locations
	has_many :locationusers, dependent: :destroy

	has_secure_password

	validates :email, uniqueness: {case_sensitive: false}, presence: true

	def generate_password_reset_token!
       update(reset_token: SecureRandom.urlsafe_base64(48))
    end

end
