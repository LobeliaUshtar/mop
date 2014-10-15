require 'rails_helper'

describe "Editing an inventory" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end
  
  it "updates the inventory and shows the inventory's updated details" do
    inventory = Inventory.create(inventory_attributes)
    
    visit inventory_url(inventory)
    
    click_link 'Edit Inventory'
    
    expect(current_path).to eq(edit_inventory_path(inventory))
        
    expect(find_field('Name').value).to eq(inventory.name)

    fill_in 'Name', with: "Updated inventory name"
    
    click_button 'Update'
    
    expect(current_path).to eq(inventory_path(inventory))

    expect(page).to have_text('Updated inventory name')

    expect(page).to have_text('Inventory successfully updated!')
  end
  
  it "does not update the inventory if it's invalid" do
    inventory = Inventory.create(inventory_attributes)
    
    visit edit_inventory_url(inventory)
    
    fill_in 'Name', with: " "
    
    click_button 'Update' 
        
    expect(page).to have_text('error')
  end
end