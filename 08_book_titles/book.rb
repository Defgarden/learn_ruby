class Book
	attr_accessor :title

	def title
		words = @title.split(' ')
		words.each_with_index do |word, i|
			case word
				when "and", "or", "the", "of", "in", "a", "an"
					if i == 0
						word.capitalize!
					else
					end
			else
				word.capitalize!
			end
		end
		return words.join(' ')
	end
end