class Oodls < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/charity/home' do
    @user = current_user.id
    @listings = Listing.all(:charity_id => @user)
    erb :charity_homepage
  end

end
