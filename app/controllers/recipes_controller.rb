class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new, :search]
  def index
    @recipes = Recipe.includes(:user).order(id: "DESC")
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe.steps.build
    @recipe.ingredients.build
    unless user_signed_in?
      flash[:notice] = "レシピ投稿にはログインが必要です"
    end
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:notice] = "レシピを投稿しました"
      redirect_to @recipe
    else
      render 'recipes/new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "レシピを更新しました"
      redirect_to @recipe
    else
      render 'recipes/edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'レシピは削除されました'
    redirect_to root_path
  end

  def search
    @keyword = params[:keyword]
    if @keyword.present?
      @recipes = Recipe.includes(:steps, :ingredients).references(:steps, :ingredients)
      @keyword.split(/[[:blank:]]+/).each do |k|
        next if k == ""
        @recipes =  @recipes.where('title like :q OR description like :q OR name like :q OR content like :q', q: "%#{k}%")
      end
    else
      @recipes = Recipe.order(id: "DESC")
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, :people, steps_attributes: [:id, :number, :content, :_destroy], ingredients_attributes: [:id, :name, :amount, :_destroy])
  end
end