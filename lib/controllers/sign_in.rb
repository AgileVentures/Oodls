class Oodls < Sinatra::Base

  get '/charity/signin' do
    erb :signin
  end
  
  post '/charity/signin' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      flash[:notice] = 'Logged in Succesfully'
      redirect('/')
    end
  end

  get '/charity/signout' do
  	flash[:notice] = 'goodbye!'
  	session[:user_id] = nil
    redirect('/')
  end

end

