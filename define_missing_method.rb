# accomodate new method dynamically using method_missing method
class MissingMethod
	def method_missing(m, *args, &block)
		str = "your new method is #{m}, with arguments: #{args}"
		if block_given?
			p str + "and has block #{block}"
		else
			p str
		end
	end

	# define a new method on the fly using define_method
	define_method "print_string" do |arg|
		p "new method is print_string with argument #{arg}"
	end

	["first", "second"].each do |method|
		define_method "my_#{method}" do
			p "dynamically created method is: my_#{method}"
		end
	end

end

m2 = MissingMethod.new
m2.my_method
m2.my_method(1,2)
m2.my_method(1,2){"this is my method block"}
m2.print_string("hello")

m2.my_first
m2.my_second



