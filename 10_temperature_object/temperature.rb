class Temperature
	def initialize(temp)


		if temp[:c] != nil
			@c = true
			@temperature = Float(temp[:c])
		end

		if temp[:f] != nil
			@f = true
			@temperature = Float(temp[:f])
		end

	end

	def in_fahrenheit
		if @f == true
			return @temperature
		else
			return ((@temperature*9)/5)+32
		end
	end

	def in_celsius
		if @c == true
			return @temperature
		else
			return ((@temperature-32)*5)/9
		end
	end

	def self.from_fahrenheit(temp)
		new(:f => temp)
	end

	def self.from_celsius(temp)
		new(:c => temp)
	end
end

class Celsius < Temperature
	def initialize(temp)
		super(:c => temp)
	end

end

class Fahrenheit < Temperature
	def initialize(temp)
		super(:f => temp)
	end
end