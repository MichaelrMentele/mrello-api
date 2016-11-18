class Api::V1::UsersController < ApplicationController
  before_action :require_login, only: [:show]
  
  def create
    binding.pry
    @user = User.create(user_params)
    if @user.save
      render json: { 
        message: "SUCCESS: New user created.", 
        user: @user, 
        status: :created
      }
    else
      render json: {
        message: "User not created. Invalid inputs.",
        status: :not_acceptable
      }
    end
  end

  def show
    render json: User.find(params[:id])
  end

  private

  def user_params
    params.permit(:fullname, :email, :password)
  end
end