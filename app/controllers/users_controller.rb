class UsersController < ApplicationController
  before_action :signed_in_user,     only: [:edit, :update, :show]
  before_action :correct_user,       only: [:edit, :update, :show]
  before_action :not_signed_in_user, only: [:new]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @chunks = @user.chunks
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Chunks!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
