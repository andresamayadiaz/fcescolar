module ApplicationHelper

  def dictamination_actions(dictamination)
    status = dictamination.status
    id = dictamination.id
    case status
    when 'Pending' 
      study_plan_id = dictamination.study_plan.id
			"<a href='/people/download_pending_teacher_dictamination?id=#{dictamination.id}' target='_blank' class='btn-sm btn-info'>Download again</a>&nbsp;<a href='javascript:void(0);' class='btn-sm btn-success accept-btn' rel=#{study_plan_id}>Accept</a>&nbsp;<a href='javascript:void(0);' class='btn-sm btn-danger reject-btn' rel=#{id}>Reject</a>".html_safe
    when 'Accepted'
      evidence_url = dictamination.evidence.url
      "<a href='/people/download_evidence?dictamination_id=#{id}'>Download Evidence</a>".html_safe
    end
  end
  
  def format_approved_subjects(subjects)
    approved_subjects = []
    subjects.each do |subject|
      approved_subjects << subject.subject.name
    end
    approved_subjects.join(", ")
  end

  def format_subjects_for_dictamination(subjects)
    subjects.map(&:name).join(", ") if subjects.present?
  end
  
  def abbrev_study_plan_name(name)
    if name.include? 'Tetramestral'
      abbrev_name = name.gsub('Tetramestral', 'TETRA')
    else
      abbrev_name = name.gsub('Semestral', 'SMTR')
    end 
    abbrev_name
  end
end
