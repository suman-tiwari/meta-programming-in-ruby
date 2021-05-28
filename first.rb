class First
	# using self keyword for class method
	puts self  # First

	def self.print_my_text
		puts self  #First
		puts "this is class method with self keyword to print some text"
	end

	#instance method is defined without self keyword
	def print_text
		puts self # First object
		puts "this is instance method to print some text"
	end
end

f1 = First.new

# prints instance method text
f1.print_text   #this is instance method to print some text
# f1.print_my_text  # Error: undefined method print_my_text for object f1

#prints class method text
First.print_my_text  #this is class method with self keyword to print some text
# First.print_text			#Error: undefined method print_text for First:Class

puts First.class #Class
print First.ancestors  # [First, Object, Kernel, BasicObject]
puts ""
puts Class.superclass  #Module