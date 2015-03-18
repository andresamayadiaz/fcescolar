class Campus < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  has_many :people

  validates :name, :presence=>true
end
