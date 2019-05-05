class BooksController < ApplicationController

  before_action :authenticate_user!#, :except => [ :show, :index ]

  def index
    # test to see if we are at /shelves/:id/books or /books
    if params.has_key?(:shelf_id)
      # get all the rangers for a specific park
      @books = Book.where(shelf_id: params[:shelf_id] )
    else
      # get All books
      @books = Book.paginate(:page => params[:page])
      @users = User.all
    end
  end

  def new
    # test to see if we are at /shelves/:id/books/new or /books/new..
    if params.has_key?(:shelf_id)
      # get all the rangers for a specific park
      @books = Book.where(shelf_id: params[:shelf_id] )
    else
    @users = User.all
    @shelves = Shelf.all
  end

  def edit
    @users = User.all
    @book = Book.find(params[:id])

  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render plain: 'book not added successfully'
    end
  end

  def update
    @book = Book.find(params[:id])

    @book.update(book_params)
    redirect_to @book

  end

  def destroy
    @book = Book.find(params[:id])
    p "hello"
    p @book
    @book.destroy

    redirect_to root_path
  end

  def show
    @book = Book.find(params[:id])

  end

private

  def book_params
    params.require(:book).permit(:title, :author, :image_url, :shelf_ids => [])
  end

end