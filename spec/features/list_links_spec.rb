require 'rails_helper'

describe "Viewing the list of links" do
  
  it "shows all the links" do
    link1 = Link.create(link_attributes)
    link2 = Link.create(link_attributes)
    link3 = Link.create(link_attributes)

    visit links_url

    expect(page).to have_text("Sites we hope you find useful.")

    expect(page).to have_text(link1.name)
    expect(page).to have_text(link2.name)
    expect(page).to have_text(link3.name)

    expect(page).to have_text(link1.website)
    expect(page).to have_text(link1.comments[0..10])
  end

end