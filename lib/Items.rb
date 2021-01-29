class Item < ActiveRecord::Base
    has_many :inventories 
    has_many :stores, through: :inventories
    has_many :carts
    has_many :customers, through: :carts
end