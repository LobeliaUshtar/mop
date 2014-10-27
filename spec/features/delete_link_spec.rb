require 'rails_helper'

describe "Deleting a link" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "destroys the link and shows the link listing without the deleted link" do
    link = Link.create(link_attributes)

    visit link_path(link)
    
    click_link 'Delete Link'
    
    expect(current_path).to eq(links_path)
    page.has_content?(link.name)
    expect(page).to have_text("Link successfully deleted!")
  end
end