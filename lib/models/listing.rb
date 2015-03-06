require_relative 'user'

class Listing

	include DataMapper::Resource

	property :id, Serial
	property :donation_centre_address, Text
  property :donation_centre_postcode, Text
  property :weekday_opening_hours, String
  property :weekend_opening_hours, String
  property :charity_id, Serial

	belongs_to :user

end
