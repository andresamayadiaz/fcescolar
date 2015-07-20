class Campus < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  has_many :people, dependent: :destroy
  has_many :classrooms, dependent: :destroy

  validates :name, :presence=>true
  validates :franchise, :presence=>true
end
