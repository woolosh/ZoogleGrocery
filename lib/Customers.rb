require 'pry'
class Customer < ActiveRecord::Base
    has_many :purchases
    has_many :items, through: :purchases

    def stores_by_distance
        Store.all.sort_by{
            |store|
            store.distance(self)
        }.collect{
            |store|
            store.name
        }
    end

    def nearby_stores
        @stores_counter = 0
        stores_by_distance[0,3]
    end

    def more_stores
        #binding.pry
        @stores_counter += 3
        if stores_by_distance[@stores_counter, 3] == nil
            "There are no more stores to show."
        else
        stores_by_distance[@stores_counter,3]
        end
    end

    def find_store_by_name(store_name)
        store = Store.select{
            |store|
            store.name == store_name
        }.sort_by{
            |store|
            store.distance(self)
        }[0,3]
        store_iterator = store.map{|store| store.name + ' at ' + store.address}
        "Here is/are the closest #{store_name}(s) to you:
        #{store_iterator}"
   end
end