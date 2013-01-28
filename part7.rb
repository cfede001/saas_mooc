class CartesianProduct
  include Enumerable
  
  attr_accessor :product
  attr_accessor :seq1
  attr_accessor :seq2

  def initialize(seq1, seq2)
     @seq1, @seq2 = seq1, seq2
  end

  def each
     @seq1.uniq.each do |item1|
        @seq2.uniq.each do |item2|
	   yield [item1, item2]
        end
     end           
  end
end

#c = CartesianProduct.new([:a,:b], [4,5])
#c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

#c = CartesianProduct.new([:a,:b], [])
#puts "\n2:", c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty

#puts "\n"
