def my_uniq(arr)
    arr.uniq
end

class Array
    def two_sum
        arr = []
        self.each_with_index do |num1, idx1|
            self.each_with_index do |num2, idx2|
                if (idx2 > idx1) && (num1 + num2 == 0)
                    arr << [idx1, idx2]
                end
            end
        end
        arr
    end

end

# rows = [
#         [0, 1, 2],
#         [3, 4, 5],
#         [6, 7, 8]
#     ]

#     row1 = rows[0]
#     row2 = rows[1]
#     row3 = rows[2]

#     cols = [
#         [0, 3, 6],
#         [1, 4, 7],
#         [2, 5, 8]
#     ]

#     col1 = cols[0]
#     col2= cols[1]
#     col3= cols[2]

def my_transpose(rows)
        cols = []
        i = 0
        while i < rows.length
            j = 0
            new_arr = []
            while j < rows[0].length
                new_arr << rows[j][i]
                j += 1
            end
            cols << new_arr
            i += 1
        end
        cols
end

def stock_picker(prices)
    arr = []
    largest = 0
        prices.each_with_index do |num1, idx1|
            prices.each_with_index do |num2, idx2|
                if (idx2 > idx1)
                    if num2 - num1 > largest
                        largest = num2 - num1
                        arr = [idx1, idx2]
                    end
                end
            end
        end
    arr
end



