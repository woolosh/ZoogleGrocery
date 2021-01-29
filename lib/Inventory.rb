class Inventory < ActiveRecord::Base
    belongs_to :store 
    belongs_to :item

    def self.get_stores_with_item(item)
        list = self.all.select{
            |inv|
            inv.item.name == item
    }.collect{
        |inv|
        "#{inv.store.name} has #{inv.quantity} #{inv.item.name}(s) at $#{inv.price} each."
    }
    
    if list.empty?
        return "This item is not available near you :("
    end
    return list
    end
end