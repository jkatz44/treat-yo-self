class BusinessController < ApplicationController
    def search_phone_number
        
    end
    
    def check_phone_number
        phoneno = params[:phone_number]
        if Card.where(:phone_number => phoneno).blank?
            redirect_to '/business/phone_number_not_found'
        else
            do_update_card(phoneno)
        end
    end
    
    def do_update_card(phoneno)
        biz = 'CVS'
        @card = Card.find_by(phone_number: phoneno, business_name: biz)
        @card.points += params[:points].to_i
        @card.save
        redirect_to '/business/confirmation'
    end
    
    def update_total_points
        biz = 'CVS'
        phoneno = '1234567890'
        @card = Card.find_by(phone_number: phoneno, business_name: biz)
    end
    
    def phone_number_not_found
    end
end
