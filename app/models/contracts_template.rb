class ContractsTemplate < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  scope :active, -> { where(status: true) }

  def self.replace_keywords(content,person,franchise)
    vals = {
      person_fullname: person.name,
      person_fullname2: person.name,
      person_id: person.id,
      username: person.user.name,
      franchise_name: franchise.name,
      franchise_address: franchise.address,
      date_now: Time.now.strftime('%Y-%m-%d'),
      date_time: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
      person_street: person.person_living_address.street,
      person_streetnumber1: person.person_living_address.num_ext
    }
    return content % vals
  end

end
