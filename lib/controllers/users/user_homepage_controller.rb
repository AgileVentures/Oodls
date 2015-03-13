class Oodls < Sinatra::Base

  get '/charity' do
    if current_user
      redirect 'charity/home'
    end
  	erb :'users/charity'
  end

  get '/charity/home' do
    if current_user
      @user = current_user.id
      @listings = Listing.all(:user_id => @user)
    end
    erb :'users/charity_homepage'
  end

end 
