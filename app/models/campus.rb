class Campus < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  has_many :people, dependent: :destroy
  has_many :classrooms, dependent: :destroy

  validates :name, :presence=>true
  validates :franchise, :presence=>true
  
  def self.get_id(name)
    campus = find_by_name(name)
    return campus.id
  end

end
