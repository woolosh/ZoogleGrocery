# Customer.all.destroy
# Inventory.all.destroy
# Item.all.destroy
# Purchase.all.destroy
# Store.all.destroy

# alex = Customer.create(user_name: "Alex", current_zip: "20001")
# truce = Customer.create(name: "Truce", current_zip: "20015")
# bode = Customer.create(name: "Bode", current_zip: "20033")

shoppers = Store.create(name: "Shoppers World", address: "1259 Washington Boulevard, D.C. 20002")
walmart = Store.create(name: "Walmart", address: "5288 Mushin street, D.C. 20019")
costco = Store.create(name: "Costco", address: "5 Oily way, Washington D.C. 20012")


bread = Item.create(name:'Bread')
sweetnsour = Item.create(name:'Sweet N Sour')
mixed_nuts = Item.create(name: "Mixed Nuts - salted")

