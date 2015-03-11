class Oodls < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/about' do
    erb :'general/about'
  end

  get '/contact' do
    erb :'general/contact'
  end

  get '/info_faq' do
    erb :'general/information_and_faq'
  end

end
