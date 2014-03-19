class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_services

  rescue_from CanCan::AccessDenied do |exception|

    if user_signed_in?
      flash[:error] = "Not authorized to view this page"
      session[:user_return_to] = nil
      redirect_to root_url

    else              
      flash[:error] = "You must first login to view this page"
      session[:user_return_to] = request.url
      redirect_to "/users/sign_in"
    end 

  end 

  private

    def find_services
      @services = Service.all
    end

end
