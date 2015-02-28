require 'sinatra/base'

class Oodls < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "/views") }

  get '/' do
    erb :index
  end

  get '/about' do
    erb :about
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
