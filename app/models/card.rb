class Card < ActiveRecord::Base
    belongs_to :customer
    
    def self.search(search)
      where("business_name LIKE ?", "%#{search}%") 
    end
end
