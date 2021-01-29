# require "pry"
# def five_implementation(store, customer)
#     puts "What would you like to do next?
#          You can:
#          1. Add item to cart
#          2. View your cart
#          3. Return to main menu
#          4. Exit"
#     choice = gets.chomp
#     case choice 
#     when "1"
#         puts "What item would you like to add to your cart?"
#         item_name = gets.chomp
#         item = Item.all.find_by(name: item_name)
#         puts "How many?"
#         quantity = gets.chomp.to_i
#         binding.pry
#         if quantity > 0
#             customer.cart.push()
#         end
#         # binding.pry
#     end
# end