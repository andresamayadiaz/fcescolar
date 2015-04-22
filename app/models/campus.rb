class Campus < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  has_many :people
  has_many :classrooms

  validates :name, :presence=>true
end
