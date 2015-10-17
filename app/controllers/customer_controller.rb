class CustomerController < ApplicationController
    def customer_view_cards
        @cards= Card.all
    end
end
