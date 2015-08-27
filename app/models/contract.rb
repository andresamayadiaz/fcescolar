class Contract < ActiveRecord::Base
  belongs_to :contracts_template
  belongs_to :person
  validates :contracts_template, :presence => true
  validates :due_date, :presence => true
  
  def self.with_due_date_tomorrow
    contracts_end_soon = where('due_date = ?', Date.today+1.days)
    if contracts_end_soon.present?
      contracts_end_soon.each do |c|
        NotificationMailer.notify_contract_end(c.person.user,c).deliver
        
        users_with_head_of_school_control_role = []
        users_with_franchise = c.person.franchise.people.map(&:user) rescue []
        
        users_with_franchise.each do |u|
          users_with_head_of_school_control_role << u if u.users_roles.map{|ur| ur.role.name=='head_of_school_control'}
        end if users_with_franchise.present? and users_with_franchise.length>0
     
        users_with_head_of_school_control_role.each do |u|
          NotificationMailer.notify_contract_end(u,c).deliver
        end if users_with_head_of_school_control_role.present? and users_with_head_of_school_control_role.length>0

      end
    end
  end

  def replace_keywords(content,person,franchise)
    content.gsub! '@@person_fullname@@', person.name
    content.gsub! '@@person_fullname2@@', person.name
    content.gsub! '@@person_id@@', person.id.to_s
    content.gsub! '@@username@@', person.name
    content.gsub! '@@franchise_name@@', franchise.name
    content.gsub! '@@franchise_address@@', franchise.address
    content.gsub! '@@date_now@@', Time.now.strftime('%Y-%m-%d')
    content.gsub! '@@date_time@@', Time.now.strftime('%Y-%m-%d %H:%M:%S')
    content.gsub! '@@person_street@@', person.person_living_address.street
    content.gsub! '@@person_streetnumber1@@', person.person_living_address.num_ext
    content.gsub! '@@person_RFC@@', person.rfc
    content.gsub! '@@person_CURP@@', person.curp
    content.gsub! '@@person_primary_email@@', person.user.email
    content.gsub! '@@person_primary_phone@@', person.contact_telephones.try(:first).try(:phone_number) rescue ""
    content.gsub! '@@person_street@@', person.person_living_address.street rescue ""
    content.gsub! '@@person_num_ext@@', person.person_living_address.try(:num_ext)
    content.gsub! '@@person_num_int@@', person.person_living_address.try(:num_int)
    content.gsub! '@@person_colonia@@', person.person_living_address.try(:colonia)
    content.gsub! '@@person_cp@@', person.person_living_address.try(:cp)
    content.gsub! '@@person_municipio@@', person.person_living_address.try(:municipio)
    content.gsub! '@@person_estado@@', person.person_living_address.try(:state).try(:name)
    content.gsub! '@@person_country@@', person.person_living_address.try(:country).try(:name)
    content.gsub! '@@person_emergency_phone@@', person.person_living_address.try(:phone_emergency) rescue ""
    content.gsub! '@@person_work_company_name@@', person.person_work_place.try(:empresa) rescue ""
    content.gsub! '@@person_work_company_puesto@@', person.person_work_place.try(:puesto) rescue ""
    content.gsub! '@@person_roles@@', person.user.users_roles.map{|ur| ur.role.name}.join(", ") rescue ""
    content.gsub! '@@Year@@', due_date.strftime('%Y')
    content.gsub! '@@Month@@', due_date.strftime('%m')
    content.gsub! '@@Day@@', due_date.strftime('%d')
    content.gsub! '@@Date@@', due_date.strftime('%Y-%m-%d')
    content.gsub! '@@Time@@', due_date.strftime("%H:%M:%S")
    return content
  end

end
