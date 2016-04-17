def measure(num = 1)
	total_time = 0
	for i in 1..num
		start_time = Time.now
		yield
		end_time = Time.now
		total_time = total_time + (end_time - start_time)
	end
	return total_time/num
end