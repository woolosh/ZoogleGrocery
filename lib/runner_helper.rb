require 'pry'
def run 

    puts "Welcome to ZoogleGrocery!"

    customer = {}

    # puts "Are you a returning user?"
    #



    puts "Enter your username"
    username = gets.chomp
    customer = Customer.all.find{|cus| username == cus.username}

    if customer     
        puts "Welcome back, #{customer.username}!"
        puts "Would you like to update your location? (Y/N)"
        x = true 
        while x 
            choice = gets.chomp 
            choice.capitalize!
            if choice == "Y"
                puts "What is your updated zip code?"
                customer.current_zip = gets.chomp
                x = false
            elsif choice == "N"
                x = false
            else
                puts "Please enter Y or N"
            end
        end

    else
        puts "Enter your zip code"
        zip_code = gets.chomp
        customer = Customer.create(username: username, current_zip: zip_code)
        puts "Welcome, #{customer.username}"
    end

    def continue?(customer)
    x = true
        while x do 
            puts "Do you want to select another option? (Y/N)"
            continue = gets.chomp
            if continue.capitalize == "N"
                exiting(customer)
            elsif continue.capitalize != "Y"
                puts "Please only type Y or N"
            else
                x = false
            end
        end
    end

    def exiting(customer) 
        puts "Do you want us to retain your data? (Y/N)"
        retain_data = gets.chomp
        x = true
        while x == true
            if retain_data.capitalize == "N"
                customer.destroy
                puts "Your records have been cleared."
                x = false
            elsif retain_data.capitalize != "Y"
                puts "Please enter Y or N"
            else
                x = false
            end
        end
        puts "See you next time!"
        exit
    end


    def valid?(store_name)
        "We can't find any #{store_name} around you :("
    end



    puts "Here are your 3 closest stores: #{customer.nearby_stores}"
    

    while true do 
        puts "\n"
        puts "What would you like to do"
        puts "You can: 
        1. Check for more stores 
        2. Find store locations by name 
        3. Check inventory by store name
        4. Find stores by item name
        5. Exit
        PLEASE ENTER A NUMBER"

        user_choice = gets.chomp
        case user_choice
        when "1"
            puts customer.more_stores
            continue?(customer)
        when "2"
            puts "What is the name of the store?"
            store = gets.chomp
            store.capitalize!
            puts customer.find_store_by_name(store)
            continue?(customer)
        when "3"
            puts "What is the name of the store?"
            store_name = gets.chomp
            store = Store.find_by(name: store_name)
            if store.nil?
                puts valid?(store_name)
            else
                puts store.inventory_list
            end
            continue?(customer)
        when "4"
            puts "What item would you like to search for"
            item = gets.chomp
            item.capitalize!
            puts Inventory.get_stores_with_item(item)
            continue?(customer)
        # when "5"
        #     puts "What store do you want to shop at?"
        #     store_name = gets.chomp
        #     store = Store.find_by(name: store_name)
        #     if store.nil?
        #         puts valid?(store_name)
        #     else
        #         puts "Here is the inventory:"
        #         puts store.inventory_list
        #     end
        # when "6"
        #     puts "Do you want to clear the items in your cart? (Y/N)"
        #     clear_data = gets.chomp
        #     customer.carts.destroy if clear_data == "Y"
        #     continue?(customer)
        when "5"
            exiting(customer)
        else
            puts "Please choose a valid number (1-5)"
        end
    end
end