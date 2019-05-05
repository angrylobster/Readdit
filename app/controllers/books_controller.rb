class BooksController < ApplicationController

  before_action :authenticate_user!#, :except => [ :show, :index ]

  def index
    @books = Book.paginate(:page => params[:page])
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  def new
    @users = User.all

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
    @book.destroy

    redirect_to root_path
  end

  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/search
  # GET /books/search.xml
  def search
    @books = Book.search do
      keywords params[:query]
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @books }
    end
  end

private

  def book_params
    params.require(:book).permit(:title, :author, :image_url, :booklist_ids =>[])
  end

end