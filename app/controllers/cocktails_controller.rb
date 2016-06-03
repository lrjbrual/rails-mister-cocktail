class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new()
  end

  def create
    @cocktail = Cocktail.new(validates_cocktail)
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

  def validates_cocktail
      params.require(:cocktail).permit(:name)
  end

end
