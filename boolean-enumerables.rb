require "pry"
# BooLean Enumerables 

# Goals 
# Understand return values for enumerators.
# Use true/false expressions within a block.
# Use the #all? enumerator to create a true/false return value.
# Use the #none? enumerator to create a true/false return value.
# Use the #any? enumerator to create a true/false return value.
# Use the #include? enumerator to create a true/false return value.

# Intro 
# When we are iterating over objects in a collection like with #each, 
# We generally don't care about the return values 
["Red", "Yellow", "Blue"].each do |color|
  puts "There are #{color.length} letters in #{color}"
end 
#= >There are 3 letters in Red
#= >There are 6 letters in Yellow
#= >There are 4 letters in Blue
# return => ["Red", "Yellow", "Blue"] 

# The block printed our output,
# The last line indicates that the #each method returned a value 
# All expressions in ruby must return a value 
# With each, the return value is always the orginal collection 
# Nothing you do inside the block you pass #each will ever change the return value 

# But that's not always the case 
# With enumerator methods, the return value of the method is very much dependent on the block 
#------------------------------------------------------------------------------------------------------

# all?
# Imagine wanting to know if all the numbers in an array are odd. 

all_odd = true 
[1, 2, 3].each do |number|
    if number.even? # Will evaluate to false for 1, true for 2, false for 3
        all_odd = false 
    end
end
puts all_odd #=> false
# binding.pry type all_odd, you'll see that it returns false 
# However, something so simple - checking if all the elements in this array are odd - isn't being expressed clearly. 
# Worse than our code not expressing our intention is that our code requires us to maintain variable state, all_odd, which can easily lead to errors 
# Say if some other piece of code accidentally changes that variable value 

# Consider the following example using #all?
all_odd = [1, 3].all? do |number|
    number.odd? # Will evaluate to true for 1, true for 3
end #=> true 
puts all_odd 
#=> true

# The rule for #all? enumerator is that the block passed to it must return true for every iteration for the entire #all? expression
# or method to return true. 
# if we introduce an even number to the collection, the return value will change 
all_odd = [1, 2, 3].all? do |number|
    number.odd? # Will evaluate to true for 1, false for 2, true for 3
end #=> false
puts all_odd #=> false 
puts ""
#-------------------------------------------------------------------------------------------------------------

# none?
# Imagine the opposite of #all?, a method #none?, where we are interested in none of the elements in a collection 
# producing a true expression within the block passed to #none?

[1,3].none?{|i| i.even?}
#=> true 
puts [1,3].none?{|i| i.even?}

# The entire expression #none? returns true b/c none of those numbers will produce a true expression 
# when asked within the block if they are even

# These higher-level boolean enumberators like #all? and #none? are way cleaner for evaluating elements in a collection
# for true/false conditions 
puts""
#------------------------------------------------------------------------------------------------------------------

# any?
# Sometimes you want to be a bit more forgiving that #all? or #none?
# and just ensure that at least one element in a collection will create a true expression within the block passed 
# any? is perfect for this. # any? enumberator will return true if at least one iteration of the block evalutes to true 
# but false if non of them do 

puts [1,2,100].any?{|i| i > 99} #=> true 

# The #any? expression above will return true because at least one element, 100, will produce a true evaluation in the block 
puts ""
#-----------------------------------------------------------------------------------------------------------

# include?
# include? is helpful if you'd like to merely compare actual content of a known value 
# It will return true if the given element exists in the object 
# If it doesn't find a match, it will return false 

the_numbers = [4,8,15,16,23,42]
puts the_numbers.include?(42)   #=> true
puts the_numbers.include?(6)   #=> false 

# The #include? expression first returns true because the_numbers[5] == 42. When it is run with 6, it will evaluate to false since that item is not present in the array.