class StudyLevel < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  has_and_belongs_to_many :subjects
  
  def self.get_sl_selected(ids)
    selected_arr = []
    ids.split(",").each do |i|
      sl = self.find(i)
      selected_arr << {:name=>sl.try(:name)}
    end
    if ids
    selected_arr
  end
  end

end
