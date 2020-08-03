require "byebug"
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @store[key.hash % num_buckets] << key
    resize! if num_buckets < @count
    @count += 1
  end

  def include?(key)
    @store[key.hash % num_buckets].each do |value|
      if value == key
        return true
      end
    end
    return false
  end

  def remove(key)
    # debugger
    if self.include?(key)
      @store[key.hash % num_buckets].each_with_index do |value, i|
        if value == key
          @store[key.hash % num_buckets] = @store[key.hash % num_buckets][0..i] + @store[key.hash % num_buckets][(i + 1)..-1]
          @count -= 1
        end
      end
    end
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
        new_arr[col.hash % num_buckets] << col
      end
    end
    @store = new_arr
  end
end
