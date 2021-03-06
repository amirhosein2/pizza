class UsersController < ApplicationController
  def index
  end
  def show
    @user = User.find(params[:id])
  end
  def new
        @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, your " << @user.faworit_food << " is ready !"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :faworit_food)
    end
end
