class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :ensure_correct_user ,only: [:edit, :update]


  def index
    @books = Book.all
    @book =Book.new
    @user = current_user
    # @user = @book.user.page(params[:page]).reverse_order
    @users =User.all
  end

  def show
    @book = Book.find(params[:id])
    @bookn =Book.new
    @user = @book.user
    @users =User.all
    @post_comment = PostComment.new
  end


  def create
    @book =Book.new(book_params)
    @book.user_id =current_user.id
    if @book.save
     redirect_to book_path(@book.id)
     flash[:complete]="You have created book successfully."
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
    else
       render :edit
       flash[:complete]="Failed to update"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:complete]="Book was successfully destroyed."
    redirect_to books_path
  end

#   def set_book
#     @book = current_user.books.find_by(id: params[:id])
#   end
  # helper_method :current_user, :logged_in?

 private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    @book = Book.find_by(id:params[:id])
    if @book.user_id != current_user.id
      redirect_to("/books")
    end
  end
 end
