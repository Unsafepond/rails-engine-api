class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def find_merchant
  	Merchant.find(params[:id])
  end

  def find_invoice
  	Invoice.find(params[:id])
  end
end
