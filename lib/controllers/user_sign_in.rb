class Oodls < Sinatra::Base

  get '/charity/signin' do
    erb :signin
  end
  
  post '/charity/signin' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      #redirect('/')
      erb :charity_homepage
    else
      flash[:notice] = 'Your email or password is incorrect'
      redirect('/charity/signin')
    end
  end

  get '/charity/signout' do
  	flash[:notice] = 'Goodbye!'
  	session[:user_id] = nil
    redirect('/')
  end

end

