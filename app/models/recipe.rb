class Recipe < ApplicationRecord
    has_many :food_stuff, dependent: :destroy
end
