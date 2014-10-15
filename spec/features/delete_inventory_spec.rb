require 'rails_helper'

describe "Deleting an inventory" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "destroys the inventory and shows the inventory listing without the deleted inventory" do
    inventory = Inventory.create(inventory_attributes)

    visit inventory_path(inventory)
    
    click_link 'Delete Inventory'
    
    expect(current_path).to eq(inventories_path)
    page.has_content?(inventory.name)
    expect(page).to have_text("Inventory successfully deleted!")
  end
end