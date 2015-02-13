class Subject < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :study_level
  belongs_to :curricular_line
  has_and_belongs_to_many :careers

  scope :by_study_level_id, ->(id) { where(:study_level_id => id)}

  def self.get_selected(ids)
  	selected_arr = []
  	ids.split(",").each do |i|
  		subject = self.find(i)
  		selected_arr << {:name=>subject.try(:name),:clave=>subject.try(:clave)}
  	end if ids
  	selected_arr
  end
end
