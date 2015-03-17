class Oodls < Sinatra::Base

  get '/charity/request_token' do
    erb :'users/request_token'
  end

  post '/charity/request_token' do
    user = User.first(:email => params[:email])
    token = user.generate_token
    timestamp = Time.now 
    user.update(token: token, timestamp: timestamp)
    erb :'users/token_request_message'
  end

  get '/charity/reset_password/:token' do
    @token = params[:token]
    erb :'users/reset_password'
  end

  post '/charity/reset_password' do
    user = User.first(token: params[:token])
    user.update(password: params[:password],
                password_confirmation: params[:password_confirmation],
                token: nil)
    redirect '/charity'
  end

end
