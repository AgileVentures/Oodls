class Oodls < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/charity/home' do
    erb :charity_homepage
  end

end
