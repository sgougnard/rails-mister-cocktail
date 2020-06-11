class DosesController < ApplicationController



# new display in show cocktail
# def new

#   @cocktail = Cocktail.find(params[:cocktail_id])
#   @dose = Dose.new
# end

def create

  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new(dose_params)
  @dose.cocktail_id = @cocktail.id

  if @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    render 'cocktails/show'
  end
end

def destroy
  @dose = Dose.find(params[:id])
  @dose.destroy
  redirect_to cocktail_path(@dose.coktail)
  end

private

def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
end

end


