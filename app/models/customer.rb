class Customer < ActiveRecord::Base
    #TODO give all these cards to the User model
    has_many :card
end
