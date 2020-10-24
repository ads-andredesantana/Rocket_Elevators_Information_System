class ApplicationController < ActionController::Base
    #  before_action :configure_permitted_parameters, if: :devise_controller?
    skip_before_action :verify_authenticity_token
end
