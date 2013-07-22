#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  	str_mod = str.downcase.gsub(/\W/, "")  
  	return str_mod == str_mod.reverse
end

def count_words(str)
	delimiter = ","
	hash_words  = Hash.new
	str.gsub(/\b\W/, delimiter).downcase.split(delimiter).each do |word|
		if hash_words.key? word
			puts hash_words[word] += 1
		else
			hash_words.store(word, 1) 
		end
	end  

	return hash_words		
end


puts palindrome("asdasd")