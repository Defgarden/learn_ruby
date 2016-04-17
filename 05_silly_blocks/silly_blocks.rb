def reverser
	yield.split(' ').map(&:reverse).join(' ')
end

def adder(num = 1)
	yield + num
end

def repeater(num = 1)
	for i in 1..num
		yield
	end
end

