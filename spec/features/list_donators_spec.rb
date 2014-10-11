require 'rails_helper'

describe "Viewing the list of donators" do
  
  it "shows the donators" do
    donator1 = Donator.create(donator_attributes)
    donator2 = Donator.create(donator_attributes)
    donator3 = Donator.create(donator_attributes)

    visit donators_url

    expect(page).to have_text("Our wonderfully generous donators...")
    expect(page).to have_text(donator1.name)
    expect(page).to have_text(donator2.name)
    expect(page).to have_text(donator3.name)

    expect(page).to have_text(donator1.website)
    expect(page).to have_text(donator1.donation)
    expect(page).to have_selector("img[src$='#{donator1.logo_link}']")
  end

=begin
  it "does not show a donator that is not current" do
    donator = Donator.create(donator_attributes(current: false))
    visit donators_path
    expect(page).not_to have_text(donator.name)
  end
=end
end