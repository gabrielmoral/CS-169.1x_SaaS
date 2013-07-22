class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' =>1}
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
      self / @@currencies[singular_currency]
    end
  end
end

class String
  def palindrome?()
    str_mod = self.downcase.gsub(/\W/, "")     
    str_mod == str_mod.reverse
  end
end

module Enumerable
  def palindrome?()
    self == self.reverse
    rescue NoMethodError
    self.to_a == self.to_a.reverse
  end
end

puts 5.rupees
puts 5.rupees.in(:yen)
puts "a man a plan a canal panama".palindrome?
puts ["a", "b", "c", "b", "b"].palindrome?