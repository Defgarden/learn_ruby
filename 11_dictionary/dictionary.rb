class Dictionary
	

	def initialize
		@dictionary = {}
	end

	def entries
		return @dictionary
	end

	def keywords
		return @dictionary.keys.sort!
	end

	def add(words)
		if words.is_a?(String) == true
			temp_hash = {words => nil}
			@dictionary.merge!(temp_hash)
		else
			@dictionary.merge!(words)
		end
	end

	def include?(key)
		return @dictionary.has_key?(key)
	end

	def find(search)
		search_hash = {}
		@dictionary.each do |key, value|
			if key.match(search)
				temp_hash = {key => value}
				search_hash.merge!(temp_hash)
			end
		end
		return search_hash
	end

	def printable
	   @dictionary.map do |key_val|
	      %Q{[#{key_val.first}] "#{key_val.last}"}
	   end.sort.join("\n")
		
	end
end