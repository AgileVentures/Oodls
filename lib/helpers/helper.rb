def current_user
  @current_user ||= User.get(session[:user_id]) if session[:user_id]
end

def update_user(parameter)
  params[parameter].empty? ? current_user.send(parameter) : params[parameter]
end

def update_listing(parameter)
  params[parameter].empty? ? listing.send(parameter) : params[parameter]
end
