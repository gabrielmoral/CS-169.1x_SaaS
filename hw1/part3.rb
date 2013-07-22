def combine_anagrams(words)
	anagrams = Array.new(0)

	words.each do |word| 

		word_anagram = Array.new(0)		

		words.each do |w| 	

			if word.chars.sort.join.downcase == w.chars.sort.join.downcase
				word_anagram.push(w)
			end
		end
		anagrams.push(word_anagram)		
	end 

	return anagrams.uniq
end


puts combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']).inspect