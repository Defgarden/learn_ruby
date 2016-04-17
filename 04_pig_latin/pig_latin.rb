def translate(word)

	# checks if there are multiple words
	if word.match(' ')
		w = Array.new
		w = word.split
		w.map! do |value|
			transform_word(value)
		end
		return w.join(' ')
	else
		return transform_word(word)
	end

	
end

def starts_vowel(word)
	#separate method to check if first letter is vowel
	case word[0]
	when 'a', 'e', 'i', 'o', 'u'
		return true
	else
		return false
	end
end

def two_consanants(word)
	#checks if word starts with two consanants
	if starts_vowel(word[0]) == false && starts_vowel(word[1]) == false
		return true
	else 
		return false
	end 
end

def three_consanants(word)
	#checks if word starts with three consanants
	if starts_vowel(word[0]) == false && starts_vowel(word[1]) == false && starts_vowel(word[2]) == false
		return true
	else 
		return false
	end
end

def transform_word(word)
	#the real transforming method

	# word length is needed for proper rearrangement of word
	n = word.length

	# punc returns true if the word has a punctuation
	punc = has_punctuation(word)
	
	#i got lazy and didn't add every single capitalization check, but it's pretty simple to implement
	#for each case
	#i did get puncation in there though, so I got that going for me
	
	if punc == true 											#this means the word has a punctuation
		p = word.slice!(n-1) 									#take out that punctuation and assign it to a variable p
		if starts_vowel(word) == true 							#ok you can get the rest
			if is_capitalize(word) == true
				return (word + 'ay' + p).capitalize
			else
				return word + 'ay' + p
			end
		elsif three_consanants(word) == true
			return word[3..(n-1)] + word[0..2] + 'ay' + p
		elsif word[1..2] == 'qu'
			return word[3..(n-1)] + word[0..2] + 'ay' + p
		elsif two_consanants(word) == true
			return word[2..(n-1)] + word[0..1] + 'ay' + p
		elsif word[0..1] == 'qu'
			return word[2..(n-1)] + word[0..1] + 'ay' + p
		else
			if is_capitalize(word) == true
				return (word[1..(n-1)] + word[0] + 'ay' + p).capitalize
			else
				return word[1..(n-1)] + word[0] + 'ay' + p
			end
		end
	else
		if starts_vowel(word) == true
			if is_capitalize(word) == true
				return (word + 'ay').capitalize
			else
				return word + 'ay'
			end
		elsif three_consanants(word) == true
			return word[3..(n-1)] + word[0..2] + 'ay'
		elsif word[1..2] == 'qu'
			return word[3..(n-1)] + word[0..2] + 'ay'
		elsif two_consanants(word) == true
			return word[2..(n-1)] + word[0..1] + 'ay'
		elsif word[0..1] == 'qu'
			return word[2..(n-1)] + word[0..1] + 'ay'
		else
			if is_capitalize(word) == true
				return (word[1..(n-1)] + word[0] + 'ay').capitalize
			else
				return word[1..(n-1)] + word[0] + 'ay'
			end
		end
	end
end

def is_capitalize(word)
	#very simple method to check if first letter is a capital letter
	#returns true if first letter is capitalized
	return word[0] == word[0].upcase
end

def has_punctuation(word)
	if word.match(/[[:punct:]]/)
		return true
	else
		return false 
	end
end
