require_relative '../config/environment'
require 'pry'



puts "Welcome to GoogleGrocery!"

customer = {}

puts "Enter your username"
username = gets.chomp
customer = Customer.all.find{|cus| username == cus.username}

if customer     
    puts "Welcome back, #{customer.username}!"
    puts "Would you like to update your location? (Y/N)"
    choice = gets.chomp
    if choice.capitalize == "Y"
        puts "What is your updated zip code?"
        customer.current_zip = gets.chomp
    end
else
    puts "Enter your zip code"
    zip_code = gets.chomp
    customer = Customer.create(username: username, current_zip: zip_code)
    puts "Welcome, #{customer.username}"
end

def continue?
x = true
    while x do 
        puts "Do you want to select another option? (Y/N)"
        continue = gets.chomp
        if continue.capitalize == "N"
            puts "See you next time!"
            exit
        elsif continue.capitalize != "Y"
            puts "Pls only type Y or N"
        else
            x = false
        end
    end
end



puts "Here are your 3 closest stores: #{customer.nearby_stores}"
puts "\n"

while true do 
    puts "What would you like to do"
    puts "You can: 
    1. Check for more stores 
    2. Find store by name 
    3. Check inventory by store_name
    4. Find stores by item
    5. Exit
    Pls enter a number"

    user_choice = gets.chomp

    if user_choice == "1"
        puts customer.more_stores
        continue?
    elsif user_choice == "2"
        puts "What is the name of the store?"
        store = gets.chomp
        store.capitalize!
        puts customer.find_store_by_name(store)
        continue?
    elsif user_choice == "3"
        puts "What is the name of the store?"
        store = gets.chomp
        store.capitalize!
        store = Store.find_by(name: store)
        puts store.inventory_list
        continue?
    elsif user_choice == "4"
        puts "What item would you like to search for"
        item = gets.chomp
        item.capitalize!
        puts Inventory.get_stores_with_item(item)
        continue?
    elsif user_choice == "5"
        puts "See you next time!"
        exit
    else
        puts "Pls choose a valid number (1-5)"
    end
end


#4. Choose a store by name (and address-closest store will be chosen if no address specified)
#4.1 check inventory of chosen store
#4.2 add_to_cart
#4.3 view cart
#--------------------------------------------------------------------
