module DonatorsHelper
  def image_for(donator)
    if donator.logo_link.blank?
      image_tag('placeholder.png')
    else
      image_tag(donator.logo_link)
    end
  end
end