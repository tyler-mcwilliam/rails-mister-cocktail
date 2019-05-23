class DosesController < ApplicationController
  # before_action :set_dose, only: [:new, :create, :destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.new
    if @dose.save
      @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail, :ingredient)
  end
end
