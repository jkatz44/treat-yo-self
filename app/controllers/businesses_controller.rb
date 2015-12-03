class BusinessesController < ApplicationController
    before_action :require_business, only: [:add_card, :update_card, :options]
    
    def options
    end
    
    def update_card
    end
    
    def check_phone_number
        phoneno = params[:phone_number]
        bizname = current_business.business
        if Card.where(:phone_number => phoneno).blank?
                redirect_to '/business/update_card', notice: "The given phone number is not associated with " + bizname + "."
        else
            do_update_card(phoneno, bizname)
        end
    end
    
    def do_update_card(phoneno, bizname)
        biz = bizname
        @card = Card.find_by(phone_number: phoneno, business_name: biz)
        if /^\d+$/.match(params[:points])
            if params[:commit] == 'Add'
                @card.points += params[:points].to_i
            elsif params[:commit] == 'Deduct'
                @card.points -= params[:points].to_i
            else
                redirect_to '/business/update_card', notice: "This failed."
            end
            
            if @card.save
                redirect_to '/business_options', notice: "Card "+@card.phone_number.to_s()+" updated successfully."
            else
                redirect_to '/business/update_card', notice: "Could not save card "+@card.phone_number.to_s()+"."
            end
        else
            redirect_to '/business/update_card', notice: "The points you entered is invalid."
        end
    end
    
    
    def phone_number_not_found
    end
    
    def add_card
    end
    
    def do_add_card
        @alert = ""
        bizname = current_business.business
        phoneno = params[:phone_number]
        pointss = params[:points]
        if Card.where(phone_number: phoneno).blank?
            @card = Card.new
            @card.points = pointss
            @card.business_name = bizname
            @card.phone_number = phoneno
            if /^\d{10,10}$/.match(phoneno) and /^\d+/.match(pointss)
                if @card.save
                    redirect_to '/business_options', notice: "Success"
                else
                    redirect_to '/business/add_card', notice:"The phone number you entered cannot be saved."
                end
            else
                redirect_to '/business/add_card', notice:"The phone number and/or points you entered is invalid."
            end
        else
            redirect_to '/business/add_card', notice: "The card with the phone number "+phoneno.to_s()+" already exists."
        end
    end
    
    def new
        @business = Business.new
    end
    
    def create 
      @business = Business.new(user_params) 
      if @business.save 
        session[:business_id] = @business.id 
        redirect_to '/business_options' 
      else 
        redirect_to '/business_signup' 
      end 
    end
    
    private
      def user_params
        params.require(:business).permit(:business, :username, :email, :password)
      end
end
