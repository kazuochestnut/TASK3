class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    @users =User.all
    @user =current_user
    @book =Book.new
  end


  def show
    @books = Book.all
    @book =Book.new
    @user = User.find(current_user.id)
    # @user = User.find(params[:id])
    @user =current_user
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
        # redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:id])
    # binding.pry

    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:complete]="You have updated user successfully."
    elsif
      render :index
      flash[:complete]=""
    else
      render :index
      flash[:complete]="Failed to save"
    end
    
  end

  private

  def set_user
    @user = User.find([:id])
  end

  def user_params
    params.require(:user).permit(:username, :intro,  :profile_image)
  end
end
