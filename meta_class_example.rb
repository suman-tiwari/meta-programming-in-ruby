class MetaClassExample

end

example = "hello"
puts example.class

def example.print_upcase
	self.upcase
end

puts example.print_upcase