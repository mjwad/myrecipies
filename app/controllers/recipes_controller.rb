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
    @recipe=Recipe.find(params[:id])
    @recipe.destroy
     redirect_to '/recipes',status: :see_other
  end

  def edit
    @recipe=Recipe.find(params[:id])
  end

  def update
    @recipe=Recipe.find(params[:id])
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


end
