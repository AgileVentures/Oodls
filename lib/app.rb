require 'sinatra/base'
require 'data_mapper'

require_relative 'controllers/application.rb'
require_relative 'controllers/about_oodls.rb'

env = ENV['RACK_FLASH'] || 'development'

DataMapper.setup(:default, "postgres://localhost/oodls_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!

class Oodls < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "/views") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end

