class MagazinesController < ApplicationController
  #checks if a user is logged in
  before_action :authenticate_user!

  #allows only admin to edit and destroy
    before_action :ensure_admin, :only=> [:edit, :destroy]

#index each magazine
def index
  @magazine = Magazine.all
end
#shows the magazines
  def show
    @magazine = Magazine.find(params[:id])
  end
  def new
    @magazine =Magazine.new
  end
#edit the magazines
def edit
@magazine = Magazine.find(params[:id])
end
# create the magazine
  def create
    @magazine = Magazine.new(magazine_params)
#save the info
  if @magazine.save
  redirect_to @magazine
  else
    render 'new'
  end
end
#edits the magazines
def update
  @magazine = Magazine.find(params[:id])

  if @magazine.update(magazine_params)
    redirect_to @magazine
  else
    render 'edit'
  end
end

#deletes magazines
#def delete
#  @magazine = magazine.find(id: params[:id])
#  @magazine.destroy

#  redirect_to magazines_path
#end

#restrict access for users
def ensure_admin
  unless current_user && current_user.admin?
    render :text => "Access Error Message", :status => :unauthorized
 end
end


#saves to the controller
  private
  def magazine_params
    params.require(:magazine).permit(:title, :text)
  end
end
