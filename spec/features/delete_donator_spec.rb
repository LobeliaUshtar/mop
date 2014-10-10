require 'rails_helper'

describe "Deleting a donator" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "destroys the donator and shows the donator listing without the deleted donator" do
    donator = Donator.create(donator_attributes)

    visit donator_path(donator)
    
    click_link 'Delete Donator'
    
    expect(current_path).to eq(donators_path)
    page.has_content?(donator.name)
    expect(page).to have_text("Donator successfully deleted!")
  end
end