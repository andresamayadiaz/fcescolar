class Officer < ActiveRecord::Base
  validates :title, :name, :last_name, :position, :presence => true

  def full_name
    "#{name} #{last_name}"
  end
end
