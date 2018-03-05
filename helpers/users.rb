helpers do

	def current_user
		if cookies[:user_id]
     @current_user ||= User.find_by_id(cookies[:user_id])
    end
end

def logged_in? 
	!current_user.nil?
end

end 