require_relative '../config/environment'
require 'pry'



puts "Welcome to GoogleGrocery!"

customer = {}

puts "Enter your username"
username = gets.chomp
customer = Customer.all.find{|cus| username == cus.username}

if customer     
    puts "Welcome back, #{customer.username}!"
else
    puts "Enter your zip code"
    zip_code = gets.chomp
    customer = Customer.create(username: username, current_zip: zip_code)
    puts "Welcome, #{customer.username}"
end




puts "Here are your 3 closest stores: #{customer.nearby_stores}"
puts "\n"
puts "What would you like to do"
puts "You can: 
1. Check for more stores 
2. Find store by name 
3. Check inventory by store_name"

user_choice = gets.chomp

if user_choice == "1"
    puts customer.more_stores
elsif user_choice == "2"
    puts "What is the name of the store?"
    store = gets.chomp
    puts customer.find_store_by_name(store)
elsif user_choice == "3"

end


#4. Choose a store by name (and address-closest store will be chosen if no address specified)
#4.1 check inventory of chosen store
#4.2 add_to_cart
#4.3 view cart

#puts "Goodbye"
#--------------------------------------------------------------------
#1.check_for_more_stores: displays more stores

#2. gets the name of the store, and displays the stores to the user

#3. displays the nearest matching store's inventory to the user
# ----
