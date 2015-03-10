class Oodls < Sinatra::Base

  get '/charity/edit' do
    @user = current_user
    erb :edit_user_account
  end

  post '/charity/edit' do
    user = current_user
    user.update(:organisation => new_organisation,
                :contact_name => new_contact_name,
                :email => new_email)
	  flash[:notice] = 'Your account has been updated'
    redirect '/charity/home'
  end

  get '/charity/delete' do
    user = current_user
    user.destroy
    flash[:notice] = 'Your account has been deleted'
    redirect '/'
  end
  
  def new_organisation
    params[:organisation].empty? ? current_user.organisation : params[:organisation]
  end

  def new_contact_name
    params[:contact_name].empty? ? current_user.contact_name : params[:contact_name]
  end

  def new_email
    params[:email].empty? ? current_user.email : params[:email]
  end

end 
