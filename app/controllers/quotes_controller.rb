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
end
