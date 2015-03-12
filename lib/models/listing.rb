require_relative 'user'

class Listing

	include DataMapper::Resource

	property :id, Serial
	property :donation_centre_address,  Text, :required => true
  property :donation_centre_postcode, Text, :required => true
  property :weekday_opening_hours,    String, :required => true
  property :weekend_opening_hours,    String, :required => true

	belongs_to :user

end
