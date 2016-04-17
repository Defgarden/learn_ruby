def add(one,two)
	return one+two
end

def subtract(one,two)
	return one-two
end

def sum(s)
	sum = 0
	s.each do |i|
		sum = sum + i
	end
	return sum
end

def multiply(s)
	sum = 0
	s.each do |i|
		if sum == 0
			sum = i
		else
			sum = sum * i
		end
	end
	return sum
end

def power(one,two)
	i = 0
	sum = 1
	while (i < two) do 
		sum = sum * one
		i+=1
	end
	return sum
end

def factorial(f)
	sum = 1

	if f == 0
		return 1
	elsif f == 1
		return 1
	else
		while f > 0 do
			sum = f * sum
			f-=1
		end
		return sum
	end	
end