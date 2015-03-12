require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, 							Serial 
	property :organisation, 		String, :required => true, :unique => true
	property :contact_name,			String
	property :email, 						String, :required => true, :unique => true
	property :password_digest,	Text#, :length => 8..20
  property :description,      String
  property :website,          String

  has n, :listings, :constraint => :destroy

	attr_reader 	:password
	attr_accessor :password_confirmation

	validates_confirmation_of :password
  # will soon have val_pres_of pass but not yet as it will break stuff until i have a method

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
