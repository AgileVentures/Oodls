#
class Oodls < Sinatra::Base

  get '/charity' do
    redirect 'charity/home' if current_user
    erb :'users/charity'
  end

  get '/charity/home' do
    if current_user
      @user = current_user.id
      @listings = Listing.all(user_id: @user)
    end
    erb :'users/charity_homepage'
  end

end
