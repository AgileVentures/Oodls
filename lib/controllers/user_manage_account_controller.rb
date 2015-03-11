class Oodls < Sinatra::Base

  get '/charity/edit' do
    @user = current_user
    erb :edit_user_account
  end

  post '/charity/edit' do
    user = current_user
    user.update(:organisation => check_empty(:organisation),
                :contact_name => check_empty(:contact_name),
                :email => check_empty(:email))
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
