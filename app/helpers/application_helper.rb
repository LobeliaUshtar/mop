module ApplicationHelper
  def page_title
    if content_for?(:title)
      "Mount Olive Pantry - #{content_for(:title)}"
    else
      "Mount Olive Pantry"
    end
  end
end