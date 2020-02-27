class DosesController < ApplicationController
def new
  @dose = Dose.new
  @cocktail = Cocktail.find(params[:cocktail_id])
end

def show
   @dose = Dose.find(params[:id])
end


def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
    redirect_to cocktail_path(@cocktail.id)
  else
    render 'new'
  end
end
    private
    def dose_params
      params.require(:dose).permit(:description)
    end
end
