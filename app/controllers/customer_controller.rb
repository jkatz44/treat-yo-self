class CustomerController < ApplicationController
    def customer_log_in
        
    end
    
    def customer_check_number
        phoneno = params[:phone_number]
        if Card.where(:phone_number => phoneno).blank?
            redirect_to '/customer', notice: "Phone number not found please try another one"
        else
            @cards = Card.where(phone_number: phoneno)
        end
    end
end
