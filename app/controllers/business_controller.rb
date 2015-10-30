class BusinessController < ApplicationController
    def options
    end
    
    def update_card
    end
    
    def check_phone_number
        phoneno = params[:phone_number]
        if Card.where(:phone_number => phoneno).blank?
                redirect_to '/business/update_card', notice: "The phone number entered does not exist."
        else
            do_update_card(phoneno)
        end
    end
    
    def do_update_card(phoneno)
        biz = 'Katz Corp.'
        @card = Card.find_by(phone_number: phoneno, business_name: biz)
        @card.points += params[:points].to_i
        if @card.save
            redirect_to '/business/', notice: "Card "+@card.phone_number.to_s()+" updated successfully."
        else
            redirect_to '/buiness/update_card', notice: "Could not save card "+@card.phone_number.to_s()+"."
        end
    end
    
    
    def phone_number_not_found
    end
    
    def add_card
    end
    
    def do_add_card
        @alert = ""
        bizname = params[:business_name]
        phoneno = params[:phone_number]
        pointss = params[:points]
        if Card.where(phone_number: phoneno, business_name: bizname).blank?
            @card = Card.new
            @card.points = pointss
            @card.business_name = bizname
            @card.phone_number = phoneno
            if @card.save
                redirect_to '/business/', notice: "Success"
            else
                redirect_to '/business/add_card', notice:"The phone number you entered cannot be saved."
            end
        else
            redirect_to '/business/add_card', notice: "The card with the phone number "+phoneno.to_s()+" already exists."
        end
    end
    
    def add_card_confirm
    end
    def add_card_error
    end
        
end
