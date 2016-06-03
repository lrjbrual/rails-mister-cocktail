class DosesController < ApplicationController
  # before_action :get_cocktail
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new()
    @ingredient = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(validates_dose)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])1
    @cocktail = @dose.cocktail
    @dose.destroy!
    redirect_to cocktail_path(@cocktail)
  end

  private

  def validates_dose
    params.require(:dose).permit(:desciption, :amount, :cocktail_id, :ingredient_id)
  end
  # def dose_params
  #     params.require(:dose).permit(:amount, :ingredient)
  # end
  #
  # def get_cocktail
  #     @cocktail = Cocktail.find(params[:cocktail])
  # end

end
