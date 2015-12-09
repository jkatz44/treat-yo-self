class CustomerController < ApplicationController
    
    def add_phonenumber_to_account
    end
    
    def do_add_phonenumber_to_account
        phoneno = params[:phonenumber]
        if User.where(phonenumber: phoneno).empty?
            if User.where(:name => current_user)
                #@phonenumber = phoneno
                if /^\d{10,10}$/.match(phoneno)
                    if current_user.update(phonenumber: phoneno)
                        redirect_to '/customer/', notice: "Welcome to Treat Yo' Self!"
                    else
                        redirect_to '/customer/customer_add_phonenumber_to_account', notice:"The phone number you entered cannot be saved."
                    end
                else
                    redirect_to '/customer/customer_add_phonenumber_to_account', notice:"The phone number you entered is invalid."
                end
            end
        else
            redirect_to '/customer/customer_add_phonenumber_to_account', notice:"The phone number you entered is already used."
        end
    end
    
    def customer_view_cards
        phoneno = current_user.phonenumber
        @cards = Card.order("business_name ASC").where(phone_number: phoneno)

        if params[:search]
            @cards = Card.search(params[:search]).order("business_name ASC")
        else
            @cards = Card.order("business_name ASC").where(phone_number: phoneno)
        end
    end
end