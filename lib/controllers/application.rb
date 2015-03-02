class Oodls < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/charity' do
  	erb :charity
  end

  get '/charity/signup' do
  	erb :signup
  end

end
