class Oodls < Sinatra::Base

  get '/charity' do
  	erb :charity
  end

  get '/charity/signup' do
  	erb :signup
  end

  post '/charity' do
  	User.create(:organisation => params[:organisation],
  							:contact_name => params[:contact_name],
  							:email => params[:email],
  							:password => params[:password])
  	redirect to '/charity'
  end

end