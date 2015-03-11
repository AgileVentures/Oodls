class Oodls < Sinatra::Base

  get '/charity' do
    if current_user
      redirect 'charity/home'
    end
  	erb :'users/charity'
  end

  get '/charity/signup' do
  	@user = User.new
  	erb :'users/signup'
  end

  post '/charity' do
  	user = User.create(:organisation => params[:organisation],
  						         :contact_name => params[:contact_name],
  							       :email => params[:email],
  							       :password => params[:password],
  							       :password_confirmation => params[:password_confirmation])
    if user.save
	    session[:user_id] = user.id
      redirect '/charity/home'
	  else
	  	flash[:notice] = "Your passwords do not match"
	  	redirect '/charity/signup'
	  end
  end

end
