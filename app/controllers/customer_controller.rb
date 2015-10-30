class CustomerController < ApplicationController
    def customer_log_in
        
    end
    
    def customer_check_number
        phoneno = params[:phone_number]
        if Card.where(:phone_number => phoneno).blank?
            redirect_to '/customer/customer_not_found'
        else
            @cards = Card.where(phone_number: phoneno)
        end
    end
    
    def customer_not_found
    end
end
