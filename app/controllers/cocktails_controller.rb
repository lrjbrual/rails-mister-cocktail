class CocktailsController < ApplicationController
  # belongs_to :validates_cocktail :show
  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new()
  end

  def create
    @cocktail = Cocktail.new(product_params)
    if @cocktail.save
      # flash[:success] = "You Successfully Saved"
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def edit
    @cocktail = Cocktain.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.dose = @dose
    @cocktail = Cocktail.update(validates_cocktail)
    redirect_to cocktail_path
  end

  private

  # def validates_cocktail
  #     params.require(:cocktail).permit(:name)
  # end

  def product_params
    params.require(:product).permit(:name, :description, :photo, :photo_cache)
  end

end
