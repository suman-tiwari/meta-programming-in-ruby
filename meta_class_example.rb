# redefining an existing class Object
class Object
	def metaclass_example
		class << self
			self
		end
	end
end


class MetaClassExample
	# way to create class method
	class << self
		def print_my_text
			puts "this is class method"
		end
	end

	def print_text
		puts "this is instance method"
	end
end

m1 = MetaClassExample.new
m1.print_text # this is instance method

MetaClassExample.print_my_text  # this is class method

p "inside metaclass self is a :" + m1.metaclass_example.to_s
# "inside metaclass self is :#<Class:#<MetaClassExample:0x000056349415bcf0>>"

# print_text is an instance method of class
p m1.class.instance_methods false   # [:print_text]

# print_my_text is an instance method of metaclass
p m1.class.metaclass_example.instance_methods false  # [:print_my_text]

example = "hello"
puts example.class

# singleton method print_upcase used with an object example
def example.print_upcase
	self.upcase
end

puts example.print_upcase
puts example.class  # String
puts example.singleton_class  # #<Class:#<String:0x000055bed1de4af0>>
# metaclass: singleton class of a class. Metaclass is also defined as the class of a class
puts String.singleton_class   # #<Class:String>

# creating class method using instance_eval
#  when you call instance_eval method, you change self to refer to the original class' metaclass
MetaClassExample.instance_eval do
	p "inside instance eval self is: " + self.to_s
	def check_text
		p "inside a method self is: "+ self.to_s
	end
end

MetaClassExample.check_text # "inside a method self is: MetaClassExample"

# creating instance method using class_eval
#  when you call class_eval method, you change self to refer to the original class
MetaClassExample.class_eval do
	p "inside class eval self is: " + self.to_s
	def check_text_class_eval
		p "inside a method self is: "+ self.to_s
	end
end

MetaClassExample.new.check_text_class_eval # "inside a method self is:  #<MetaClassExample:0x000055b95cfda190>