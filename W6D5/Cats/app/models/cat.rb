# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    
    COLORS = ['black','brown','white','orange','green']
    SEX = ['M','F']
    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :color, inclusion: { in: COLORS}
    validates :sex, inclusion: {in: SEX}
    validate :age

    def self.colors
        COLORS
    end

    def age
        @age = Time.now.year - self.birth_date.year
    end

end
