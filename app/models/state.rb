class State < ActiveRecord::Base
  resourcify
  belongs_to :country
  validates :country, :presence => true
  validates :name, :presence => true
  
  def self.get_id(name)
    state = find_by_name(name)
    return state.id
  end

end
