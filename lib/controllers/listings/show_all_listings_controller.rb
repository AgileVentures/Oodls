#
class Oodls < Sinatra::Base

  get '/listings/all' do
    @listings = Listing.all
    erb :'listings/list_all_charities'
  end

end
