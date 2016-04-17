def ftoc(tempf)
	float = Float(tempf)
	return ((float-32)*5)/9
end

def ctof(tempc)
	float = Float(tempc)
	return ((float*9)/5)+32
end

