class ShelvesController < ApplicationController

  # before_action :authenticate_user!#, :except => [ :show, :index ]

  def index
    @shelves = Shelf.all
  end

  def show
    # @book = Book.find(params[:id])
  end

  def new
    @books = Book.all
    @user = current_user
  end

  def edit
    # @users = User.all
    # @book = Book.find(params[:id])
  end

  def create
    @shelf = Shelf.new(shelf_params)
    @shelf.save
    # # if @book.save
      redirect_to shelves_path
    # else
      # render plain: 'book not added successfully'
    # end
  end

  def update
    # @book = Book.find(params[:id])

    # @book.update(book_params)
    # redirect_to @book
  end

  def destroy
    # @book = Book.find(params[:id])
    # @book.destroy

    # redirect_to root_path
  end

private

  def shelf_params
    params.require(:shelf).permit(:user_id, :name, :book_id)
  end

end