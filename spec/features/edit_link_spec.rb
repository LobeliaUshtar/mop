require 'rails_helper'

describe "Editing a link" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end
  
  it "updates the link and shows the link's updated details" do
    link = Link.create(link_attributes)
    
    visit link_url(link)
    
    click_link 'Edit Link'
    
    expect(current_path).to eq(edit_link_path(link))
        
    expect(find_field('Name').value).to eq(link.name)

    fill_in 'Name', with: "Updated link name"
    
    click_button 'Update Link'
    
    expect(current_path).to eq(link_path(link))

    expect(page).to have_text('Updated link name')

    expect(page).to have_text('Link successfully updated!')
  end
  
  it "does not update the link if it's invalid" do
    link = Link.create(link_attributes)
    
    visit edit_link_url(link)
    
    fill_in 'Name', with: " "
    
    click_button 'Update Link' 
        
    expect(page).to have_text('error')
  end
end