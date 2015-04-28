module ApplicationHelper

  def format_subjects_for_dictamination(subjects)
    subjects.map(&:name).join(", ") if subjects.present?
  end
end
