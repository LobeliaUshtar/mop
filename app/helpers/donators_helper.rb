module DonatorsHelper
  def image_for(donator)
    if donator.logo_file_name.blank?
      image_tag('placeholder.png')
    else
      image_tag(donator.logo_file_name)
    end
  end
end