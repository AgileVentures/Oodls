def current_user
  @current_user ||= User.get(session[:user_id]) if session[:user_id]
end

def check_empty(parameter)
  params[parameter].empty? ? current_user.send(parameter) : params[parameter]
end
