# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_after_action :verify_authorized, only: %i(new create destroy)

  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])

    if @user&.validate_password(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have been logged in."
    else
      flash[:notice] = "The email/password you provided was incorrect"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out."
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
