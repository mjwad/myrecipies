class IngredientsController < ApplicationController
  before_action :set_ingredients,only:   [:edit,:show,:update]
  before_action :require_admin,except: [:show,:index]
  def index
    @ingredient=Ingredient.paginate(page: params[:page],per_page: 5)
  end

  def new
    @ingredient=Ingredient.new
  end

  def create
    @ingredient=Ingredient.new(set_ingredients_params)
    if @ingredient.save
      flash[:success]="Ingredient has been succssfully Saved"
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @ingredient_recipes=@ingredient.recipes.paginate(page: params[:page],per_page: 5)
  end

  def update
    if @ingredient.update(set_ingredients_params)
      flash[:notice]="Ingredient was Updated Successfully"
      redirect_to  ingredient_path(@ingredient)
    else
      render 'edit'
    end
  end

  private

  def set_ingredients_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredients
    @ingredient=Ingredient.find(params[:id])
  end

  def require_admin
    if !logged_in? || (logged_in?  and !current_chef.admin?)
      flash[:danger]="Only admin users can perform that action"
      redirect_to ingredients_path
    end
  end
end

