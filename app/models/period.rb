class Period < ActiveRecord::Base
	belongs_to :franchise
	has_many :period_details
	validates :franchise, :initial_month, :month_length, :number_of_blocks, :start_year, :name , :presence => true

	after_save :generate_period_details

	def generate_period_details
		inserts = []
		j = 0
		while j < number_of_blocks do
			new_initial_month = j==0 ? initial_month : initial_month+(j*month_length).months
			end_month = j==0 ? initial_month+(month_length-1).months : new_initial_month+(month_length-1).months
			year = new_initial_month
			inserts.push "('#{new_initial_month}', '#{end_month}', '#{year}', #{id})"
			j = j + 1
		end
		sql = "INSERT INTO period_details (`initial_month`, `end_month`, `year`, `period_id`) VALUES #{inserts.join(", ")}"
		ActiveRecord::Base.connection.execute sql
	end
end
