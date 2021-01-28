# Customer.all.destroy
# Inventory.all.destroy
# Item.all.destroy
# Purchase.all.destroy
# Store.all.destroy

# alex = Customer.create(user_name: "Alex", current_zip: "20001")
# truce = Customer.create(name: "Truce", current_zip: "20015")
# bode = Customer.create(name: "Bode", current_zip: "20033")

shoppers = Store.create(name: "Shoppers World", address: "1259 Washington Boulevard, Washington, D.C. 20002")
bargain = Store.create(name: "Bargain Shopper", address: "625 Bargain St, Washington, D.C. 20002")
wallys = Store.create(name: "Wally's", address: "131 Alamo St, Washington, D.C. 20002")
costco = Store.create(name: "Costco", address: "5 Oily way, Washington, D.C. 20012")
boscos = Store.create(name: "Bosco's", address: "12 Union Blvd, Washington, D.C. 20012")
kroger = Store.create(name: "Kroger", address: "4000 Washington Boulevard, Washington, D.C. 20012")
heb = Store.create(name: "H-E-B", address: "525 Williams Way, Washington, D.C. 20012")
walmart = Store.create(name: "Walmart", address: "5288 Mushin Street, Washington, D.C. 20019")



bread = Item.create(name:'Bread')
sweetnsour = Item.create(name:'Sweet N Sour')
mixed_nuts = Item.create(name: "Mixed Nuts - salted")
milk = Item.create(name: "Milk")
chips = Item.create(name: "Doritos")
chili = Item.create(name: "Wolf Brand Chili")