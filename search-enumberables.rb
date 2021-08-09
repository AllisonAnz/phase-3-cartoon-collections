# Search Enumberables 
# Link: https://learning.flatironschool.com/courses/2661/pages/search-enumerables?module_item_id=202327

# Goals
# Understand return values for enumerators.
# Use a truthy or falsey evaluation in a block.
# Use #select to select matching elements from a collection based on a block.
# Use #detect to find a matching element from a collection based on a block.
# Use #reject to filter matching elements from a collection based on a block.

# Intro 
# Every method in ruby must return a value 
# When we iterate or enumberate over a collection with #each, the return value is 
# always the orginal collection. This is an example of a static return value 
# no matter what we do with #each, it will always return the same object that received the call to #each 
["Red", "Yellow", "Blue"].each do |color|
  puts "There are #{color.length} letters in #{color}"
end 
#=> (output) There are 3 letters in Red
#=> (output) There are 6 letters in Yellow
#=> (output) There are 4 letters in Blue
#=> (return) ["Red", "Yellow", "Blue"] 

# Often we want to search for elements in a collection based on a condition. 
# Imaging wanting to find all even numbers in a collection of numbers using # each 
matches = []
[1,2,3,4,5].each do |i|
  matches << i if i.even? # add i to the matches array if it is even
end #=> [1,2,3,4,5]
matches #=> [2,4] 

# Implementing a selection routine with low-level enumberators like #each is costly 
# 1. We have to hang out to the matches with the local array matches. 
#    Programmers use the phrse maintain state to refer to this task. Cars can be in a state like "Reverse, Drive, Neutral"
#    Our matches array has states of "Empty, [2], [2,4]"
# 2. Our block is complicated with conditional logic that can be implicit with a better enumerator 
# 3. Our code lacks intention and clear sematics. If we mean, #find_all or #select, why don't' we just say that?
#---------------------------------------------------------------------------------------------------

# select
# When you envoke #select on a collection, the return value will be a new array containing all the elements 
# of the collection that cause the block passed to #select to return true 
# Means for each iteration, if the block evalutes to true, the elements yield to that iteration will be kept in 
# the return value array
[1,2,3,4,5].select do |number|
    number.even?
end #=> (return) [2, 4]

# In the first iteration of the block, number is assigned to the value of 1. Because 1.even? returns false 
# 1 will not be in the return array for this call to #select. In the second iteration, number will be 2. 
# B/c 2.even? will return true, 2 WILL be in the return array (same with 4)
[1,2,3,4,5].select{|i| i.odd?} #=> [1,3,5]

[1,2,3].select{|i| i.is_a?(String)} #=> [] 
#--------------------------------------------------------------------------------------------------------

# detect or #find 
#NOTE: detect and find are two names for the same method. You can use them interchageably 

# Where as #select will return all elements from the orginal collection that case the block to evaluate to true 
# detect (or # find) will only return the first element that makes the block true 
[1,2,3].detect{|i| i.odd?} #=> 1 
[1,2,3].find{|i| i.odd?} #=> 1 

# You can see, even though both 1 and 3 would cause the block to evaluate to true, because 1 is first in the array, 
# it alone is returned. 
[1,2,3,4].detect{|i| i.even?} #=> 2
[1,2,3,4].detect{|i| i.is_a?(String)} #=> nil 

# Notice also that #detect will always return a single object where #select always return an array 
#-------------------------------------------------------------------------------------------------------------

# reject 
# reject will return an array with elements for which the block is false 
[1,2].reject{|i| i.even?} #=> [1] 