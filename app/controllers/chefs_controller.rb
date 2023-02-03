class ChefsController < ApplicationController
  before_action :set_chef,only: [:edit, :update, :show, :destory]
  def index
    @chef=Chef.all
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef=Chef.new(chef_params)
    if @chef.save
        flash[:success]="Welcome #{@chef.name} to MyRecipe App"
        redirect_to  chef_path(@chef)
    else
        render 'new'
    end
  end

  def show
  end

  def destroy
    @chef.destroy
     redirect_to '/chef',status: :see_other
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
end