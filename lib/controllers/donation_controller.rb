#
class Oodls < Sinatra::Base

  get '/donation' do
    erb :donation_landing_page
  end

  get '/map' do
    erb :map
  end

end
