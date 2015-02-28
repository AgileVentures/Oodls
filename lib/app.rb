require 'sinatra/base'

require_relative 'controllers/application.rb'
require_relative 'controllers/about_oodls.rb'

class Oodls < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "/views") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
