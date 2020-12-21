class UsersController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user , only: [:edit ,:update]

  def index
    @users =User.all
    @user =current_user
    @book =Book.new
  end


  def show
    @book =Book.new
    # @user = User.find(current_user.id)
    @user = User.find(params[:id])
    # @user =current_user
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
    else
      render :edit
      flash[:complete]="Failed to save"
    end
  end
  
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  

  private
  
    def set_user
      @user = User.find([:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :introduction,  :profile_image)
    end
    # def correct_user
    #   redirect_to(user_url) unless params[:id] == current_user.id
    #   # redirect_to(user_url) unless @user == current_user
    # end
  
    def ensure_correct_user
      @user = User.find_by(id:params[:id])
      if @user.id != current_user.id
        redirect_to("/users/#{current_user.id}")
      end
    end
    
    def zipedit
      params.require(:user).permit(:postcode, :prefecture_name, :address_city, :address_street, :address_building)
    end
    
  end