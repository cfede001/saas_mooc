#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  str = str.gsub(%r([^a-zA-Z]), '').downcase

  str == str.reverse
end

def count_words(str)
  x = Hash.new(0)
  str.downcase.scan(/\w+/) do |w| x[w] += 1 end
  return x
end


#the code below this line will test your functions.  You should remove everything below this line prior to submitting your file

def check (test_str)
   if palindrome? test_str
     puts test_str + " is a palindrome!"
   else
     puts test_str + " is NOT a palindrome!"
   end
end

str = "there !!goes the neighborhood"
check (str)

str = "Go hang a salami, I'm a lasagna hog!"
check (str)

str = "dad"
check (str)

print count_words("I doubt this works")
print "\n"
print count_words("A man, a plan, a canal -- Panama")
print "\n"

