class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  def index
    @leads = Lead.all
  end


   def create    
    lead = Lead.new
    lead.fullName = params[:fullName]
    lead.companyName = params[:companyName]   
    lead.email = params[:email]   
    lead.phone = params[:phone]   
    lead.projectName = params[:projectName]   
    lead.projectDescription = params[:projectDescription]   
    lead.department = params[:department]  
    lead.subject = params[:subject]   
    lead.message = params[:message]   
    lead.attachedFile = params[:attachedFile]   
    
    lead.save   
    end
  end