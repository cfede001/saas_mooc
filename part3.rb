def combine_anagrams(words)
  output_array = Array.new(0)
  words.each do |word1|
    temp_array = []
    words.each do |word2|
      if (word2.downcase.chars.sort == word1.downcase.chars.sort)
        temp_array << word2 
      end
    end
    output_array << temp_array
  end
  return  output_array.uniq
end

#print combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']), "\n"


