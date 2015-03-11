class Oodls < Sinatra::Base

  get '/about' do
    erb :about
  end

  get '/contact' do
    erb :contact
  end

  get '/info_faq' do
    erb :information_and_faq
  end

end
