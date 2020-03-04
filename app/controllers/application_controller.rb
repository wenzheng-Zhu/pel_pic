class ApplicationController < ActionController::Base

	helper_method :current_user, :logged_in?      #这一行定义以后，这两个方法就可以在views中调用

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		!!current_user
	end
end
