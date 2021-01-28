class Store < ActiveRecord::Base
    has_many :inventories
    has_many :items, through: :inventories
    
    # def zip
    #     address.split.last.to_i
    # end

    def distance(customer)
        (self.address.split.last.to_i - customer.current_zip.to_i).abs
    end


end