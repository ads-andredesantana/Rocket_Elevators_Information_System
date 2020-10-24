class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]


  # GET /quotes/new
  def new
    @quote = Quote.new
  end


  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)
    quote.save!

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end


    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:fullName, :email, :phone, :businessname, :projectname, :buildingtype, :quality, :nbapartment, :nbfloor, :nbbasement, :nbbusiness, :nbparking, :nbshaft, :nboccupant, :nbcompanies, :activehours, :nbelevator, :elevatorprice, :subtotal, :installfee, :total)
    end

def create    
  quote = Quote.new
  quote.nbApparts = params[:Number_Appart]
  quote.nbFloors = params[:Number_Floor]   
  quote.nbBasements = params[:Basement_Number]   
  quote.nbBusiness = params[:Number_Business]   
  quote.nbParking = params[:Number_Parking]   
  quote.nbCages = params[:Number_cages]    
  quote.occupantPerfloors = params[:Occupant_per_floors]   
  quote.numberHour = params[:Number_Hour]   
  quote.type = params[:type] 
  quote.recommendedNumber = params[:Recommended_Number]   
  quote.elevatorCost = params[:Elevator_cost].delete('$ ,')   
  quote.totalElevatorCost = params[:Total_elevator_cost].delete('$ ,') 
  quote.totalInstal = params[:Total_instal].delete('$ ,')  
  quote.total = params[:Full_total].delete('$ ,')  

  quote.save
  redirect_to :thank_you
end
end