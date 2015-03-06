class Oodls < Sinatra::Base

  get '/listing/new' do
    erb :new_listing_form
  end

end

