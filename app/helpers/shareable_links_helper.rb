module ShareableLinksHelper
  def share_link(record)
    if record.shareable_link&.token
      shareable_link_url(record.shareable_link&.token)
    else
      t('helpers.no_link')
    end
  end
end
