require 'rails_helper'

describe "Editing a donator" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end
  
  it "updates the donator and shows the donator's updated details" do
    donator = Donator.create(donator_attributes)
    
    visit donator_url(donator)
    
    click_link 'Edit Donator'
    
    expect(current_path).to eq(edit_donator_path(donator))
        
    expect(find_field('Name').value).to eq(donator.name)

    fill_in 'Name', with: "Updated donator name"
    
    click_button 'Update Donator'
    
    expect(current_path).to eq(donator_path(donator))

    expect(page).to have_text('Updated donator name')

    expect(page).to have_text('Donator successfully updated!')
  end
  
  it "does not update the donator if it's invalid" do
    donator = Donator.create(donator_attributes)
    
    visit edit_donator_url(donator)
    
    fill_in 'Name', with: " "
    
    click_button 'Update Donator' 
        
    expect(page).to have_text('error')
  end
end