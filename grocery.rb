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
  puts "Welcome to RubyCo! What would you like to do?"
  puts "1) View Available Products"
  puts "2) View My Cart"
  puts "3) Exit Store"
  puts "Please choose 1, 2, or 3"
  user_input = gets.strip.to_i
  if user_input == 1
    puts "----------------"
    avail_products     
    elsif user_input == 2
        view_cart
    elsif user_input == 3
      puts "Thanks for shopping today! Goodbye!"
      exit 
    else
      puts "Invalid Input. Try 1, 2, or 3."
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
  puts "----------------"
  add_to_cart
end

# --------------------------------------------------------------------------
# Create a menu option to add items to a user's grocery cart.

def add_to_cart
  puts "To add product to your cart enter item number. To return to the main menu enter M to return to the main menu."
  user_input = gets.strip
    if user_input == "M"
      menu
    else
      user_input = user_input.to_i
      @cart << @products[user_input - 1]
    end
  puts "#{@products[user_input - 1][:product]} added to your cart. If you wish to add more, enter the item number. Or, enter M to return to the main menu."
  user_input2 = gets.strip
  if user_input2 == "M"
    menu
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
  else 
    add_more(user_input.to_i)
  end
end

# --------------------------------------------------------------------------
# Create a menu option to display all the items in the cart.

def view_cart
  cart_total = 0
  @cart.each_with_index do |product, index|
    print "#{index + 1}. #{product[:product]} - "
    puts "$#{product[:price]}"
    cart_total += product[:price]
  end
  puts "---------"
  puts "Cart Total: $#{cart_total}"
  puts "To remove a product, enter the item number. Or, enter M to return to the Main Menu."
    index = gets.strip.to_i
  user_input = gets.strip
  if user_input == "M"
    menu
  else 
    remove_product(index - 1)
    puts "Invalid Input. Enter M."
  end
end

# --------------------------------------------------------------------------
# Create a menu option to remove an item from the users cart.

def remove_product(index)
  @cart.delete_at(index)
  puts "Product removed from cart."
  view_cart
end



#     puts "Invalid choice."

menu


# --------------------------------------------------------------------------
# Create a menu option to show the total cost of all the items in the user's cart.



# --------------------------------------------------------------------------
# Add new items to the grocery store.


# --------------------------------------------------------------------------
# Zip it up and turn it in!



# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# @movies = [
#   {name: "Jaws", rating: "PG", genre: "thriller"},
#   {name: "Halloween", rating: "R", genre: "horror"}
# ]


# # @movies.each do |movie|
# #   puts movie[:name]
# # end
# def menu
#   puts "What would you like to do?"
#   puts "1). Create a movie"
#   puts "2). View all movies"
#   puts "3). Update a movie"
#   puts "4). Delete a movie"
#   puts "5). exit"
# end

# def add_movie
#   @movie = {name: "", rating: "", genre: ""}
#   puts "What is the name of your movie?"
#   @movie[:name] = gets.strip
#   # @movie[:name] = name
#   puts "What is the rating of the movie?"
#   @movie[:rating] = gets.strip
#   puts "What is the genre?"
#   @movie[:genre] = gets.strip

#   # @movies << @movie
#   @movies.push(@movie) 
# end

# def view_movies
#   # #{} <- allows you to use a variable within a string
#   @movies.each_with_index do |movie,index|
#     puts "#{index + 1}). #{movie[:name]} - #{movie[:rating]}"
#     puts movie[:genre]
#     puts
#   end
# end

# def update_movie(index)
#   puts "What is the new name?"
#   @movies[index][:name] = gets.strip
#   puts "What is the new rating?"
#   @movies[index][:rating] = gets.strip
#   puts "What is the new genre?"
#   @movies[index][:genre] = gets.strip
# end

# def delete_movie(index)
#   # .delete_at(index)
#   @movies.delete_at(index)
#   puts "Movie deleted"
#   view_movies
# end

# def app
#   menu
#   @option = gets.strip.to_i

#   # if @option == 1
#   #   #do something
#   # elsif @option == 2

#   case @option
#   when 1
#     add_movie
#     app
#   when 2
#     view_movies
#     app
#   when 3
#     puts "What movie do you want to update?"
#     view_movies
#     index = gets.strip.to_i
#     update_movie(index - 1)
#     app
#   when 4
#     puts "What movie do you want to delete?"
#     view_movies
#     index = gets.strip.to_i
#     delete_movie(index - 1)
#     app
#   when 5
#     exit
#   else
#     puts "Please enter one of the number options"
#     app
#   end


# end
# app