class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  def index
    @leads = Lead.all
  end

  

  def new
    @lead = Lead.new
    lead.save!
  end

  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
        if @lead.save
          format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
          format.json { render :show, status: :created, location: @lead }
        else
          format.html { render :new }
          format.json { render json: @lead.errors, status: :unprocessable_entity }
        end
      end
    end

 

    # Only allow a list of trusted parameters through.
    def lead_params
      params.require(:lead).permit(:full_name, :company_name, :phone, :project_name, :project_description, :department_in_charge_of_elevators, :message, :attached_file)
    end
  end