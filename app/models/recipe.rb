class Recipe < ApplicationRecord
    has_many :food_stuffs, dependent: :destroy
    accepts_nested_attributes_for :food_stuffs, allow_destroy: true
end
