#
class Oodls < Sinatra::Base

  post '/charity/signin' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect '/charity/home'
    else
      flash[:notice] = 'Your email or password is incorrect'
      redirect '/charity'
    end
  end

  get '/charity/signout' do
    flash[:notice] = 'Goodbye!'
    session[:user_id] = nil
    redirect '/'
  end

end
