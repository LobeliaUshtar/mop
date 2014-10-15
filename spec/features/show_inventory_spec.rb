require 'rails_helper'

describe "View a specific inventory" do
  it "shows the inventory's details" do
    inventory = Inventory.create(inventory_attributes)

    visit inventory_url(inventory)

    expect(page).to have_text(inventory.name)
    expect(page).to have_text(inventory.count)
    expect(page).to have_text(inventory.shop)
  end
end