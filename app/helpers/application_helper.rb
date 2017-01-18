module ApplicationHelper
  def active_for(desired_actions = [])
    if desired_actions.any? { |action| action == "#{controller_name}##{action_name}" }
      'active'
    end
  end
end
