module ApplicationHelper
  def active_for(desired_actions = [])
    if desired_actions.any? { |action| action == "#{controller_name}##{action_name}" }
      'active'
    end
  end

  def share_link(record)
    if record.shareable_link&.token
      shareable_link_url(record.shareable_link&.token)
    else
      'No link found'
    end
  end
end
