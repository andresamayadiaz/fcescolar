class ContractsTemplate < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  scope :active, -> { where(status: true) }

  def self.replace_keywords(content,person,franchise)
    content.gsub! '@@person_fullname@@', person.name
    content.gsub! '@@person_fullname2@@', person.name
    content.gsub! '@@person_id@@', person.id.to_s
    content.gsub! '@@username@@', person.user.name
    content.gsub! '@@franchise_name@@', franchise.name
    content.gsub! '@@franchise_address@@', franchise.address
    content.gsub! '@@date_now@@', Time.now.strftime('%Y-%m-%d')
    content.gsub! '@@date_time@@', Time.now.strftime('%Y-%m-%d %H:%M:%S')
    content.gsub! '@@person_street@@', person.person_living_address.street
    content.gsub! '@@person_streetnumber1@@', person.person_living_address.num_ext
    return content
  end

end
