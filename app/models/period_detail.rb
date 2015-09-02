class PeriodDetail < ActiveRecord::Base
  resourcify
  belongs_to :period

  validates :period, :initial_month, :end_month, :year, :presence => true

  def self.update_params(p)
    permitted_params = p.except(:controller,:action).permit!
    updated_params = permitted_params.dup
    updated_params[:initial_month] = Date.parse("#{permitted_params[:year]}-#{permitted_params [:initial_month]}-1")
    updated_params[:end_month] = Date.parse("#{permitted_params[:year]}-#{permitted_params [:end_month]}-1")
    updated_params[:year] = Date.parse("#{permitted_params[:year]}-#{permitted_params [:initial_month]}-1")
    return updated_params
  end
	
  def self.multiple_add(start_year,start_month,num_to_add,period)
    num = num_to_add.to_i
		inserts = []
		j = 0
    id = period.id
    month_length = period.month_length
    updated_initial_month = Date.new(start_year.to_i,start_month.to_i)
		while j < num do
			new_initial_month = j==0 ? updated_initial_month : updated_initial_month+(j*month_length).months
			end_month = j==0 ? updated_initial_month+(month_length-1).months : new_initial_month+(month_length-1).months
			year = new_initial_month
			inserts.push "('#{new_initial_month}', '#{end_month}', '#{year}', #{id})"
			j = j + 1
		end
		sql = "INSERT INTO period_details (`initial_month`, `end_month`, `year`, `period_id`) VALUES #{inserts.join(", ")}"
    begin
        ActiveRecord::Base.connection.execute sql
        true
    rescue
        false
    end
	end

  def get_months
    selected_year = self.year.strftime('%Y')
    selected_period_id = self.period_id
    selected_period_details = PeriodDetail.where('period_id=? and extract(year  from year) = ?',selected_period_id,selected_year)
    months =  selected_period_details.map{|spd| {:id=>spd.id, :month=>spd.initial_month.strftime('%b') } }
    months
  end

  def self.get_month_range(selected_year)
    period_details = where('extract(year from year) = ?',selected_year)
    return period_details.map{|period_detail| {:id=>period_detail.id, :month=>"#{period_detail.initial_month.strftime('%b')} - #{period_detail.end_month.strftime('%b')}" } }
  end

end
