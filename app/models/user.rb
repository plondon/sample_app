class User < ActiveRecord::Base

	before_save { email.downcase! }
	before_create :create_remember_token

	validates :name, presence: true, length: { maximum: 50 }
	# The above can also be written like so:
	# validates(:name, presence: true)
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
	has_secure_password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
<<<<<<< HEAD
=======
		
>>>>>>> b2851ed12371322d1fd36f6e1dc5c6bf0c087703
end
