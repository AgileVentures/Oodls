require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, 							Serial 
	property :organisation, 		String
	property :contact_name,			String
	property :email, 						String
	property :password_digest,	Text
  property :description,      String
  property :website,          String

  has n, :listings, :constraint => :destroy

	attr_reader 	:password
	attr_accessor :password_confirmation
	validates_confirmation_of :password

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

  def self.authenticate(email, password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
