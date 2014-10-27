require "rails_helper"

describe "Creating a new link" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "first opens the new link page" do
    visit links_url

    click_link 'Add New Link'

    expect(current_path).to eq(new_link_path)
  end

  it "saves the link and shows its details" do
    visit links_url

    click_link 'Add New Link'

    expect(current_path).to eq(new_link_path)

    fill_in "Name", with: "value"
    fill_in "Website", with: "value"
    fill_in "Comments", with: "value"

    click_button 'Create Link'

    expect(current_path).to eq(link_path(Link.last))

    expect(page).to have_text('value')

    expect(page).to have_text('Link successfully created!')
  end
end