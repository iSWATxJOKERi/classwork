class Towers
    attr_reader :towers


    def initialize
        @towers = Array.new(3) {Array.new}
        self.setup_discs
    end

    def setup_discs
        (0..2).each do |i|
            @towers[0] << i + 1
        end
    end
    
    def [](pile)
        @towers[pile]
    end

    def move(pile, end_pile)
       disc = self[pile].shift
       self[end_pile].unshift(disc)
    end

end
