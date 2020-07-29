class Calender < ApplicationRecord
    #カレンダーからレシピを取得
    has_many :recipes,-> { order("created_at ASC") }, dependent: :destroy   #ASC小順にデータ取得
    accepts_nested_attributes_for :recipes
end
