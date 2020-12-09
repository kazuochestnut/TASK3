class BooksController < ApplicationController
 before_action :authenticate_user!

  def index
    @books = Book.all
    @book =Book.new
    @user =current_user
    @users =User.all
  end

  def show
    @book = Book.find(params[:id])
    @user =current_user
    @users =User.all
  end


  def create
    @book =Book.new(book_params)
    @book.user_id =current_user.id
    if @book.save
     redirect_to book_path(@book.id)
     flash[:complete]="Book was successfully created."
    elsif
     @books =Book.all
     @user =current_user
     render :index
     flash[:complete]=""
    else
     @books = Book.all
     @user =current_user
     render :index
     flash[:complete]="Failed to save"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
       redirect_to book_path(@book)
       flash[:complete]="You have updated book successfully."
    elsif
       @books =Book.all
       render :index
       flash[:complete]=""
    else
       @books = Book.all
       render :index
       flash[:complete]="Failed to update"
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
