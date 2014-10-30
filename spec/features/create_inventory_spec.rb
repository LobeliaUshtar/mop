require 'rails_helper'

describe "Creating a new inventory" do
  before do
    @inventory = Inventory.create!(inventory_attributes)
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end
  
  it "first opens the new inventory page" do
    visit inventories_url
    
    click_link 'Add New Inventory'
    
    expect(current_path).to eq(new_inventory_path)
  end


  it "saves the inventory and shows its details" do    
    visit inventories_url
    
    click_link 'Add New Inventory'
    
    expect(current_path).to eq(new_inventory_path)
    
    fill_in "Name", with: "New Name"
    fill_in "Prefered Size", with: "10 oz"
    choose('Yes')
     
    click_button 'Create'

    expect(current_path).to eq(inventory_path(Inventory.last))
    
    expect(page).to have_text('New Name')

    expect(page).to have_text('Yay for more in the pantry!')
  end

  it "does not save the inventory if it's invalid" do
    visit new_inventory_url
    
    expect { 
      click_button 'Create' 
    }.not_to change(Inventory, :count)
    
    expect(current_path).to eq(inventories_path)   
    expect(page).to have_text('error')
  end
end