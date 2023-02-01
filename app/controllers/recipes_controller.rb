class RecipesController < ApplicationController

  def index
    @recipe=Recipe.all
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
    @recipe=Recipe.find(params[:id])
  end

  def destroy
  end

  def edit
  end

  private

  def recipe_params
      params.require(:recipe).permit(:name,:description)
  end


end
