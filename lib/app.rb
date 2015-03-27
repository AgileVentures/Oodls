require 'sinatra'
require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/controllers/**/*.rb'].each { |file| require file }

require_relative './data_mapper_setup.rb'
require_relative 'helper_methods/helper.rb'

class Oodls < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::Flash
  use Rack::MethodOverride

  set :root, File.dirname(__FILE__)
  set :views, proc { File.join(root, '/views') }
  set :public_folder, 'public'

  run! if app_file == $PROGRAM_NAME

end
