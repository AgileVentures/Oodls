require 'sinatra'
require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/listing'
require_relative 'controllers/application_controller.rb'
require_relative 'controllers/about_oodls_controller.rb'
require_relative 'controllers/user_sign_up_controller.rb'
require_relative 'controllers/user_sign_in_controller.rb'
require_relative 'controllers/listings_controller.rb'
require_relative 'controllers/map.rb'
require_relative './data_mapper_setup.rb'
require_relative 'helpers/helper.rb'

class Oodls < Sinatra::Base

	enable :sessions
	set :session_secret, 'super secret'
  
	register Sinatra::Flash
  use Rack::MethodOverride

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "/views") }
  set :public_folder, 'public'

  run! if app_file == $0
end
