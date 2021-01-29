class Store < ActiveRecord::Base
    has_many :inventories
    has_many :items, through: :inventories
    
    # def zip
    #     address.split.last.to_i
    # end

    def distance(customer)
        (self.address.split.last.to_i - customer.current_zip.to_i).abs
    end

    def inventory_list
        list = self.inventories.collect{
            |inv|
            "#{self.name} has #{inv.quantity} #{inv.item.name}(s) at $#{inv.price} each."
        } 
        if list.empty?
            return "This store has no inventory"
        end
        return list
    end

    


end