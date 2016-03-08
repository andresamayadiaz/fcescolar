class CurricularLine < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  has_and_belongs_to_many :subjects

  def self.get_cl_selected(ids)
    selected_arr = []
    ids.split(",").each do |i|
      cl = self.find(i)
      selected_arr << {:name=>cl.try(:name)}
    end if ids
    selected_arr
  end

end
