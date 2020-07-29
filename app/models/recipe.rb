class Recipe < ApplicationRecord
    belongs_to :calender, optional: true   #カレンダーテーブルと紐付け
end
