class AdminsController < ApplicationController
  before_action :redirect
  def index
    @users = User.where(approved: true)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_register_params)

    if @admin.save
      redirect_to admins_path, notice: 'Successfully created new Admin!'
    else
      redirect_to admins_new_path, alert: @admin.errors.full_messages.first
    end
  end

  protected

  def admin_register_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
