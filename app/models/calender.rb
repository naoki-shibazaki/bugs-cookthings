class Calender < ApplicationRecord
  def start_time
    self.visit_day
  end
end
