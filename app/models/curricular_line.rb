class CurricularLine < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  has_many :subjects, dependent: :destroy
end
