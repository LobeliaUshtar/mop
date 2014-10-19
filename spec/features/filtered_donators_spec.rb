require 'rails_helper'

describe "Filtering donators" do
  before do
    @donator_yes = Donator.create!(donator_attributes(name: 'Gabby1', current: true))
    @donator_no = Donator.create!(donator_attributes(name: 'Gabby2', current: false))
  end

  it "shows only the current donators" do
    visit donators_url

    click_link "Our Donators"

    expect(current_path).to eq("/donators")

    expect(page).to have_text(@donator_yes.name)
    expect(page).not_to have_text(@donator_no.name)
  end

  context "while an admin" do
    before do
      admin = User.create!(user_attributes(admin: true))
      sign_in(admin)
    end

    it "shows all donators, current and not" do
      visit donators_url

      click_link "All Recorded Donators"

      expect(current_path).to eq("/donators/filter/all")

      expect(page).to have_text(@donator_yes.name)
      expect(page).to have_text(@donator_no.name)
    end

    it "shows only the former donators" do
      visit donators_url

      click_link "Former Donators"

      expect(current_path).to eq("/donators/filter/former")

      expect(page).not_to have_text(@donator_yes.name)
      expect(page).to have_text(@donator_no.name)
    end
  end
end