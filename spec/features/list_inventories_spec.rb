require 'rails_helper'

describe "Viewing the list of inventories" do
  
  it "shows the inventories" do
    inventory1 = Inventory.create(inventory_attributes)
    inventory2 = Inventory.create(inventory_attributes)
    inventory3 = Inventory.create(inventory_attributes)

    visit inventories_url

    expect(page).to have_text("inventory")
    expect(page).to have_text(inventory1.name)
    expect(page).to have_text(inventory2.name)
    expect(page).to have_text(inventory3.name)

    expect(page).to have_text(inventory1.count)
    expect(page).to have_text(inventory1.shop)
  end
end