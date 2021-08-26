@products = [
  {product: "Milk", price: 2.29},
  {product: "Bread", price: 3.50},
  {product: "Eggs", price: 3.25},
  {product: "Cereal", price: 4.56}
]

@cart = [
]
# --------------------------------------------------------------------------
# Display a menu in the console for the user to interact with.
def menu
  puts "---------------------------------------------"
  puts "Welcome to RubyCo! What would you like to do?"
  puts
  puts "1) View Available Products"
  puts "2) View My Cart"
  puts "3) Exit Store"
  puts "Please choose 1, 2, or 3"
  user_input = gets.strip.to_i
  if user_input == 1
    puts "---- AVAILABLE PRODUCTS ----"
    puts
    avail_products
    elsif user_input == 2
        view_cart
    elsif user_input == 3
      puts "Thanks for shopping today! Goodbye!"
      exit
    else
      puts "**INVALID INPUT**"
      menu
    end
end
# --------------------------------------------------------------------------
# Create a default array of hashes that represent items at a grocery store.
def avail_products
  @products.each_with_index do |product, index|
    print "#{index + 1}. #{product[:product]} - "
    puts "$#{product[:price]}"
  end
  puts
  puts "----------------------------"
  add_to_cart
end
# --------------------------------------------------------------------------
# Create a menu option to add items to a user's grocery cart.
def add_to_cart
  puts "To add product to your cart enter item number. To return to the main menu enter M."
  user_input = gets.strip
    if user_input == "M"
      menu
    elsif user_input == ""
      puts "INVALID INPUT"
      add_to_cart
    elsif user_input == "0"
      puts "INVALID INPUT"
      add_to_cart
    else
      user_input = user_input.to_i
      @cart << @products[user_input - 1]
    end
  puts "#{@products[user_input - 1][:product]} added to your cart. If you wish to add more, enter the item number. Or, enter M to return to the main menu."
  user_input2 = gets.strip
  if user_input2 == "M"
    menu
  elsif user_input2 == ""
    puts "INVALID INPUT"
    add_more
  else
    add_more(user_input2.to_i)
  end
end

def add_more(user_input)
  @cart << @products[user_input - 1]
  puts "#{@products[user_input - 1][:product]} added to your cart. If you wish to add more, enter the item number. Or, enter M to return to the main menu."
  user_input = gets.strip
  if user_input == "M"
    menu
  elsif user_input == ""
    puts "INVALID INPUT"
    add_to_cart
  else
    add_more(user_input.to_i)
  end
end
# --------------------------------------------------------------------------
# Create a menu option to display all the items in the cart.
# Create a menu option to show the total cost of all the items in the user's cart.
def view_cart
  cart_total = 0.00
  puts "--------CART------------"
  @cart.each_with_index do |product, index|
    print "#{index + 1}. #{product[:product]} - "
    puts "$#{product[:price]}"
    cart_total += product[:price]
  end
  puts "------------------------"
  puts "Cart Subtotal: $#{cart_total.round(2)}"
  tax = cart_total * 0.068
  puts "Tax: $#{tax.round(2)}"
  puts "Cart Total: $#{(cart_total + tax).round(2)}"
  puts "___________________________________________________________________________________"
  puts "To remove a product, enter the item number. Or, enter M to return to the Main Menu."
  user_input = gets.strip
    if user_input == "M"
      menu
    elsif user_input == ""
      puts "**INVALID INPUT**"
      view_cart
    elsif user_input == "0"
      puts "**INVALID INPUT**"
      view_cart
    else
      user_input = user_input.to_i
      remove_product(user_input - 1)
    end
end
# --------------------------------------------------------------------------
# Create a menu option to remove an item from the users cart.
def remove_product(index)
  @cart.delete_at(index)
  puts "**Product removed from cart.**"
  view_cart
end
menu


# --------------------------------------------------------------------------
# 
# --------------------------------------------------------------------------
# Add new items to the grocery store.
# --------------------------------------------------------------------------
# Zip it up and turn it in!


