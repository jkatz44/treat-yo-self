class BusinessesController < ApplicationController
    before_action :require_business, only: [:add_card, :update_card, :options]
    
    def options
    end
    
    def business_view_cards
        bizname = current_business.business
        @cards = Card.where(business_name: bizname)
    end
    
    def update_card
    end
    
    def check_phone_number
        phoneno = params[:phone_number]
        bizname = current_business.business
        if Card.where(:phone_number => phoneno, :business_name => bizname).blank?
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
        customername = params[:customer_name]
        if Card.where(customer_name: customername, phone_number: phoneno, business_name: bizname).blank?
            @card = Card.new
            @card.points = pointss
            @card.business_name = bizname
            @card.phone_number = phoneno
            @card.customer_name = customername
            @card.bizlogo = current_business.bizlogo
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
            redirect_to '/business/add_card', notice: "The card with the phone number "+phoneno.to_s()+" already exists for "+bizname.to_s()+"."
        end
    end
    
    def new
        @business = Business.new
    end
    
    def create 
      sparams = user_params
      if sparams[:business].empty?
          redirect_to '/business_signup', notice: "You must enter a name for your business."
      elsif not Business.where(username: sparams[:username]).blank?
          redirect_to '/business_signup', notice: "The username "+sparams[:username]+" already exists."
      else
        @business = Business.new(sparams) 
        if @business.save!
            session[:business_id] = @business.id 
            redirect_to '/business_options' 
        else 
            redirect_to '/business_signup', notice: "Your business could not be saved in the system."
        end
      end
    end
    
    private
      def user_params
        params.require(:business).permit(:business, :username, :email, :bizlogo, :password)
      end
end
