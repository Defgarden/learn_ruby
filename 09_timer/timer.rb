class Timer
	attr_accessor :timer, :seconds

	def seconds
		if @timer == nil
			return 0
		end
		yield
	end

	def time_string
		hours = @seconds / 3600
		hours_str = hours.to_s.rjust(2, "0")
		minutes = (@seconds - (hours * 3600)) / 60
		minutes_str = minutes.to_s.rjust(2, "0")
		leftover_seconds = @seconds - (hours * 3600) - (minutes * 60)
		leftovers = leftover_seconds.to_s.rjust(2, "0")
		return (hours_str + ':' + minutes_str + ':' + leftovers)
	end
end