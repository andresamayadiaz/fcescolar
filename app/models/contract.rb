class Contract < ActiveRecord::Base
  belongs_to :contracts_template
  belongs_to :person
end
