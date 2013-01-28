class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_accessor attr_name        # create the attribute's getter
    attr_accessor attr_name+"_history" # create bar_history getter
    class_eval %Q{ 
 	def #{attr_name}=(value)
          @#{attr_name}_history ||= [nil]
          @#{attr_name}_history << value
          @#{attr_name} = value
        end

        def #{attr_name}_history
          @#{attr_name}_history
        end
    }
  end
end

class Foo
    attr_accessor_with_history :foo
    attr_accessor_with_history :bar
end#

#print f = Foo.new     # => #<Foo:0x127e678>
#print f.bar = 3       # => 3
#print f.bar = :wowzo  # => :wowzo
#print f.bar = 'boo!'  # => 'boo!'
#print f.bar_history   # => [nil, 3, :wowzo, 'boo!']

#print c = Foo.new     # => #<Foo:0x127e678>
#print "\n", c.bar = 3       # => 3
#print "\n", c.bar = :wowzo  # => :wowzo
#print "\n", c.bar = 'boo!'  # => 'boo!'
#print "\n", c.bar_history   # => [nil, 3, :wowzo, 'boo!']
