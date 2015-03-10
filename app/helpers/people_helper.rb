module PeopleHelper
	def display_contact_history(param)
		if param.present?
			param.kind_of?(Array) ? param.last : param
		else
			'<i>Idéntico</i>'.html_safe
		end
	end

	def display_contact_history_state(param)
		state_id = param.kind_of?(Array) ? param.last : param
		state = State.find(state_id).try(:name) rescue '<i>Idéntico</i>'.html_safe
		state
	end

	def display_contact_history_country(param)
		country_id = param.kind_of?(Array) ? param.last : param
		country = Country.find(country_id).try(:name) rescue '<i>Idéntico</i>'.html_safe
		country
	end
end
