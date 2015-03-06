require 'data_mapper'
require_relative './models/user.rb'
require_relative './models/listing.rb'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/oodls_#{env}")

DataMapper.auto_upgrade!
DataMapper.finalize
