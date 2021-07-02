class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if buyer_signed_in?
      @user = current_buyer
    elsif broker_signed_in?
      @user = current_broker
    end
  end
end
