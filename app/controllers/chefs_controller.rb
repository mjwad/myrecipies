class ChefsController < ApplicationController
  before_action :set_chef,only: [:edit, :update, :show, :destory]
  before_action :require_same_user,only: [:edit,:destroy,:update]
  before_action :require_admin,only: [:destroy]
  def index
    @chef=Chef.all
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef=Chef.new(chef_params)
    if @chef.save
        session[:chef_id]=@chef.id
        flash[:success]="Welcome #{@chef.name} to MyRecipe App"
        redirect_to  chef_path(@chef)
    else
        render 'new'
    end
  end

  def show
    @chef_recipe=@chef.recipes.paginate(page: params[:page],per_page: 5)
  end

  def destroy
    @chef=Chef.find(params[:id])
    if !@chef.admin?
      @chef.destroy
      flash[:danger]="Chef and all associated recipes have been deleted"
      redirect_to '/chefs',status: :see_other
    end
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      flash[:notice]="Chef was Updated Successfully"
      redirect_to  chef_path(@chef)
    else
      render 'edit'
    end
  end

  private

  def chef_params
      params.require(:chef).permit(:name,:email,:password,:password_confirmation)
  end

  def set_chef
    @chef=Chef.find(params[:id])
  end
  def require_same_user
    if current_chef!=@chef and !current_chef.admin?
      flash[:danger]="You are only allowed to delete your own account"
      redirect_to chefs_path
    end
  end

  def require_admin
    if logged_in? && !current_chef.admin?
      flash[:danger]="Only admin users can perform that action"
      redirect_to root_path
    end
  end
end
