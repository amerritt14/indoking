# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: %i(show edit update destroy)

    def index
      @users = policy_scope(User)
    end

    def show
    end

    def new
      authorize @user = User.new
    end

    def edit
    end

    def create
      authorize @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          session[:user_id] = @user.id
          format.html { redirect_to root_path, notice: "You have successfully signed up!" }
        else
          flash[:notice] = "There was a problem creating your user."
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to [:admin, @user], notice: "User was successfully updated." }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_url, notice: "User was successfully destroyed." }
      end
    end

    private

    def set_user
      authorize @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :salt)
    end
  end
end
