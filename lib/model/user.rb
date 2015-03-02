require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, 							Serial 
	property :organisation, 		String
	property :contact_name,			String
	property :email, 						String
	property :password_digest,	Text

	def password=(password)
		self.password_digest = BCrypt::Password.create(password)
	end

end