class BusinessController < ApplicationController
    def search_phone_number
        biz = 'CVS'
        phoneno = '1234567890'
        @card = Card.find_by(phone_number: phoneno, business_name: biz)
    end
    
    def update_total_points
        biz = 'CVS'
        phoneno = '1234567890'
        @card = Card.find_by(phone_number: phoneno, business_name: biz)
    end
    
    def do_update_card
        biz = 'CVS'
        phoneno = '1234567890'
        @card = Card.find_by(phone_number: phoneno, business_name: biz)
        @card.points += params[:card][:points].to_i
        @card.save
        redirect_to '/business/confirmation'
    end
end
