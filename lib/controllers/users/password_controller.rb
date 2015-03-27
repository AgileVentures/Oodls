class Oodls < Sinatra::Base

  get '/charity/request_token' do
    erb :'users/request_token'
  end

  post '/charity/request_token' do
    mailer = Mailer.new
    user = User.first(:email => params[:email])
    user.update(token: user.generate_token, timestamp: Time.now)
    mailer.send_email(params[:email], user.token)
    erb :'users/token_request_message'
  end

  get '/charity/reset_password/:token' do
    user = User.first(token: params[:token])
    if user.token_valid?
      @token = params[:token]
      erb :'users/reset_password'
    else
      flash[:notice] = 'That token has expired, please request another'
      redirect '/charity/request_token'
    end
  end

  post '/charity/reset_password' do
    user = User.first(token: params[:token])
    user.update(password: params[:password],
                password_confirmation: params[:password_confirmation],
                token: nil)
    redirect '/charity'
  end

end
