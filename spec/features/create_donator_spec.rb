require "rails_helper"

describe "Creating a new donator" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "first opens the new donator page" do
    visit donators_url

    click_link 'Add New Donator'

    expect(current_path).to eq(new_donator_path)
  end

  it "saves the donator and shows its details" do
    visit donators_url

    click_link 'Add New Donator'

    expect(current_path).to eq(new_donator_path)

    fill_in "Name", with: "value"
    fill_in "Website", with: "value"
    fill_in "Description", with: "value"

    click_button 'Create Donator'

    expect(current_path).to eq(donator_path(Donator.last))

    expect(page).to have_text('value')

    expect(page).to have_text('Donator successfully created!')
  end
end