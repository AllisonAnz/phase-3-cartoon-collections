require "pry"
# Goals
# Get familiar iterating through arrays with enumerator methods like .collect or .map, .find, and .include?.
# Build methods and control their return values.
# Practice control flow with if and else statements.

# This method accepts an array of names 
dwarves = ["Doc", "Dopey", "Bashful", "Grumpy"] 
# Should print out each name, in number order using, puts 
def roll_call_dwarves(dwarves) 
  dwarves.map.each_with_index do |dwarve, index| 
    puts "#{index + 1}. #{dwarve}"
  end
end

roll_call_dwarves(dwarves)
# => (outputs) 1. Doc # => 2. Dopey # => 3. Bashful # => 4. Grumpy
# => (returns) [nil, nil, nil, nil]

#--------------------------------------------------------------------------
# Accepts an argument of planeteer calls 
planeteer_calls = ["earth", "wind", "fire", "water", "heart"]
# Should capitalize each element and add an elclamation point to the end 
# The return value of this method should be an array 
# The .map or .collect method might be approprate for this task 
def summon_captain_planet(planeteer_calls)
  planeteer_calls.map do |planeteer| 
    planeteer.capitalize + "!" 
  end 
end
#=> (returns) => ["Earth!", "Wind!", "Fire!", "Water!", "Heart!"]
#binding.pry and type summon_captain_planet(planeteer_calls) to see the return
puts summon_captain_planet(planeteer_calls)
#=> (outputs) Earth! #=> Wind! #=> Fire! #=> Water! #=> Heart!

# Above could also be written 
# def summon_captain_planet(planeteer_calls)
#  planeteer_calls.map { |call| call.capitalize + '!' }
# end

#--------------------------------------------------------------------------
# Should accept an array of calls 
# The method should tell use if any of the calls are longer than four characters 
# Notice the return value of this method is either true of false, depending on the array it was given as an argument 
planeteer_calls = ["earth", "wind", "fire", "water", "heart"]
def long_planeteer_calls(planeteer_calls)
  planeteer_calls.any? {|planeteer| planeteer.length > 4}
end
# binding.pry long_planeteer_calls(planeteer_calls) =>(returns) true
puts long_planeteer_calls(planeteer_calls)
#=> (outputs) true

# accepts an array of strings 
# Should look through these strings to find and return the first string that is a type of cheese 
possible_cheese = ["cheddar", "rope", "pie", "gouda"]
def find_the_cheese(possible_cheese)
  # the array below is here to help
  cheese_types = ["cheddar", "gouda", "camembert"]
  possible_cheese.find do |maybe_cheese|
    cheese_types.include?(maybe_cheese)
  end
end

#binding.pry find_the_cheese(possible_cheese) #=>(returns) "cheedar"
puts find_the_cheese(possible_cheese)
#=> (outputs) cheddar
# We pass in possible_cheese array into the method find_the cheese 
# using the find enumberable, we iterate through each element (maybe_cheese)
# and find the first element that is included in the cheese_types array 
# gouda wont be returned because it only returns the first element that matches

# Below the method will return all the cheeses that match
def find_all_cheese(possible_cheese)
  cheese_types = ["cheddar", "gouda", "camembert"]
  possible_cheese.select do |maybe_cheese|
    cheese_types.include?(maybe_cheese)
  end
end

puts find_all_cheese(possible_cheese)
# => cheddar, gouda
# You could also use find_all instead of .select