class Oodls < Sinatra::Base

  get '/charity/edit' do
    @user = current_user
    erb :'users/edit_user_account'
  end

  post '/charity/edit' do
    user = current_user
    user.update(:organisation => update_model(:organisation, user),
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
