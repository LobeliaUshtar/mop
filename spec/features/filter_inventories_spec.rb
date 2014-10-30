require 'rails_helper'

describe "Filtering inventories" do

  it "shows only the low count inventory" do
    inventory = Inventory.create!(inventory_attributes(running_low: true))

    visit inventories_url

    click_link "What We Need Most"

    expect(current_path).to eq("/inventories")

    expect(page).to have_text(inventory.name)
  end

  it "shows all inventories" do
    inventory = Inventory.create!(inventory_attributes(running_low: false))

    visit inventories_url

    click_link "Entire Inventory"

    expect(current_path).to eq("/inventories/filter/all")

    expect(page).to have_text(inventory.name)
  end
end