require 'rails_helper'

describe "View individual link" do
  it "show the link's details" do
    link = Link.create(link_attributes)

    visit link_url(link)

    expect(page).to have_text(link.name)
    expect(page).to have_text(link.website)
    expect(page).to have_text(link.comments)
  end
end