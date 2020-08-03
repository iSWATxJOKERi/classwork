require "byebug"
class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max 
    @store = Array.new(max)
  end

  def insert(num)
    if (num <= @max) && (num >= 0)
      @store[num] = true
      return true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return true if @store[num] == true
    return false
  end

  private

  def is_valid?(num)

  end

  def validate!(num)

  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store[num % num_buckets].pop
  end

  def include?(num)
    i = num % num_buckets
    self[i].each do |value|
      return true if value == num
    end
    return false
  end

  private

  def [](num)
    self.store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      @store[num % num_buckets] << num
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      @store[num % num_buckets].each_with_index do |value, i|
        if num == value
          @store[num % num_buckets] = @store[num % num_buckets][0...i] + @store[num % num_buckets][(i + 1)..-1]
        end
      end
      @count -= 1
    end
  end

  def include?(num)
    self.store[num % num_buckets].each do |value|
      if value == num
        return true
      end
    end
    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(@num_buckets *= 2) { Array.new }
    @store.each_with_index do |row, i|
      row.each_with_index do |col, j|
        new_arr[col % num_buckets] << col
      end
    end
    @store = new_arr
  end

end
