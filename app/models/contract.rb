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
end
