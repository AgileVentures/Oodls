class Oodls < Sinatra::Base

  get '/charity/home' do
    if current_user
      @user = current_user.id
      @listings = Listing.all(:user_id => @user)
    end
    erb :'users/charity_homepage'
  end

  get '/charity/edit' do
    @user = current_user
    erb :'users/edit_user_account'
  end

  post '/charity/edit' do #i would like this method to require password confirmation at some point
    user = current_user
    user.update(:organisation => update_model(:organisation, user),
                :description => update_model(:description, user),
                :website => update_model(:website, user),
                :contact_name => update_model(:contact_name, user),
                :email => update_model(:email, user))
	  flash[:notice] = 'Your account has been updated'
    redirect '/charity/home'
  end

  get '/charity/delete' do
    user = current_user
    user.destroy
    flash[:notice] = 'Your account has been deleted'
    redirect '/'
  end
  
end 
