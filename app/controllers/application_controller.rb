class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user


  	def current_user
    	@current_user ||= User.find_by(id: session[:user_id])
	end


	def find_resource
		class_name = params[:controller].singularize
		klass = class_name.camelize.constantize
		self.instance_variable_set "@" + class_name, klass.find(params[:id])
	end
end
