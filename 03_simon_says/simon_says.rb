def echo(text)
	return text
end

def shout(text)
	return text.upcase
end

def repeat(*args)
	if args.size == 1
		return args[0] + ' ' + args[0]
	elsif args.size == 2
		return (args[0] + ' ') * (args[1]-1) + args[0]
	elsif args.size > 2
		puts "Too many parameters called!"
	end
end

def start_of_word(word, n)
	return word[0..(n-1)]
end

def first_word(sentence)
	return (sentence.split)[0]
end

def titleize(sentence)
	if sentence.match(' ') == nil
		return sentence.capitalize
	end
	words = Array.new
	words = sentence.split(' ')
	words.each_with_index do |word, i|
		case word
			when "the", "over", "and", "is"
			if i == 0
				word.capitalize!
			end
		else
			word.capitalize!
		end
	end
	return words.join(' ')
end