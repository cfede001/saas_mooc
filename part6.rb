class Numeric
  @@currencies = {'dollar' => 1.00, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * (1 / @@currencies[singular_currency])
    end
  end  
end

class String
  def palindrome?
    temp = self.gsub(%r([^a-zA-Z]), '').downcase
    temp == temp.reverse
  end
end

module Enumerable
  def palindrome?
    self == self.reverse
  rescue NoMethodError
    self.to_a == self.to_a.reverse
  end
end


