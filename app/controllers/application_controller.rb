class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_customer
  def authenticate_customer
  	if session[:customer_id].blank?
  		redirect_to signin_customers_path
  	end
  end
end
