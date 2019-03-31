class BooksController < ApplicationController
#checks if a user is logged in
  before_action :authenticate_user!

#allows only admin to edit and destroy
  before_action :ensure_admin, :only=> [:edit, :destroy]

  #http_basic_authenticate_with name: "staff1", password: "library", except: [:index, :show]
#index each book
def index
  @book = Book.all
  #search 
  #@book = Book.search(params[:search])
end
#shows the books
  def show
    @book = Book.find(params[:id])
  end
  def new
    @book =Book.new
  end
#edit the books
def edit
@book = Book.find(params[:id])
end
# create the book
  def create
    @book = Book.new(book_params)
#save the info
  if @book.save
  redirect_to @book
  else
    render 'new'
  end
end
#edits the books
def update
  @book = Book.find(params[:id])

  if @book.update(book_params)
    redirect_to @book
  else
    render 'edit'
  end
end

#restrict access for users
def ensure_admin
  unless current_user && current_user.admin?
    render :text => "Access Error Message", :status => :unauthorized
 end
end

#deletes Books
#def delete
#  @book = Book.find(id: params[:id])
#  @book.destroy

#  redirect_to books_path
#end

#saves to the controller
  private
  def book_params
    params.require(:book).permit(:title, :text)
  end
end
