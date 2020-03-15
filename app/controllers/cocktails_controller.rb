class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    set_cocktail
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'cocktail successfully created.'
    else
      render :new
    end
  end

  def destroy
    set_cocktail
    @cocktail.destroy
    redirect_to root_path, notice: 'cocktail deleted.'
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
