class MyClass
	def greeting
		puts "welcome to send method example"
	end

	def greeting_with_message(msg)
		puts msg
	end

	private
	def private_greeting(msg)
		puts msg
	end
end

c1 = MyClass.new

#send method is an instance method of Object. First argument for send method is the name of method and other arguments
# are the arguments of that method
c1.send(:greeting)
c1.send(:greeting_with_message, "Welcome home suman")

#both private and public methods can be called by send method
c1.send(:private_greeting, "This is private method greeting you")