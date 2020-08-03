require "byebug"
class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    key = ""
    self.each_with_index do |ele, i|
      if ele.is_a?(Integer)
        key += (ele + i).to_s
      elsif ele.is_a?(Array)
        key += ele.hash
      elsif ele.is_a?(String)
        key += ele.hash
      end
    end
    key.to_i
  end
end

class String
  def hash
    key = ""
    alphabet = "{}=>:abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    self.each_char.with_index do |char, i|
      key += (char.ord + i).to_s
    end
    key.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # 0
    # debugger
    # key = []
    # self.each do |k,v|
    #   key << [k,v]
    # end
    # key.sort_by {|ele| ele[0].to_s}.hash
    self.to_s.hash
  end
end
