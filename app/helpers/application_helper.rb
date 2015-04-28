module ApplicationHelper

  def dictamination_actions(status,id)
    case status
    when 'Pending' 
			"<a href='javascript:void(0);' class='btn-sm btn-success'>Accept</a>&nbsp;<a href='javascript:void(0);' class='btn-sm btn-danger reject-btn' rel=#{id}>Reject</a>".html_safe
    when 'Accepted'
      "<a href='#'>Download Evidence</a>".html_safe
    else 'Rejected'
    end
  end

  def format_subjects_for_dictamination(subjects)
    subjects.map(&:name).join(", ") if subjects.present?
  end
end
