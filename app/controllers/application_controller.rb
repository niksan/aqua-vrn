class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_services

  private

    def find_services
      @services = Service.all
    end

end
