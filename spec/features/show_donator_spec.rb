require 'rails_helper'

describe "View individual donator" do
  it "shows the donator's details" do
    donator = Donator.create(donator_attributes)

    visit donator_url(donator)

    expect(page).to have_text(donator.name)
    expect(page).to have_text(donator.website)
    expect(page).to have_text(donator.description)
  end

  it "has an SEO-friendly URL" do
    donator = Donator.create!(donator_attributes(name: "X-Men: The Last Stand"))

    visit donator_url(donator)

    expect(current_path).to eq("/donators/x-men-the-last-stand")    
  end
end