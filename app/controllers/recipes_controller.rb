class RecipesController < ApplicationController
  before_action :set_recipe,only: [:edit, :update, :show, :destory]
  def index
    @recipes=Recipe.paginate(page: params[:page],per_page: 5)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe=Recipe.new(recipe_params)
    @recipe.chef=Chef.first
    if @recipe.save
        flash[:notice]="Recipe was created Successfully"
        redirect_to  recipe_path(@recipe)
    else
        render 'new'
    end
  end

  def show
  end

  def destroy
    @recipe.destroy
     redirect_to '/recipes',status: :see_other
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice]="Recipe was Updated Successfully"
      redirect_to  recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  private

  def recipe_params
      params.require(:recipe).permit(:name,:description)
  end

  def set_recipe
    @recipe=Recipe.find(params[:id])
  end
end
