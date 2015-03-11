def current_user
  @current_user ||= User.get(session[:user_id]) if session[:user_id]
end

def update_model(parameter, model)
  params[parameter].empty? ? model.send(parameter) : params[parameter]
end
