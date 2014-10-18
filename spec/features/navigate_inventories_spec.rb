require 'rails_helper'

describe "Navigating inventories" do
  it "allows navigation from the detail page to the listing page" do
    inventory = Inventory.create(inventory_attributes)

    visit inventory_url(inventory)

    click_link "What We Need Most"

    expect(current_path).to eq(inventories_path)
  end

  it "allows navigation from the listing page to the detail page" do
    inventory = Inventory.create(inventory_attributes)

    visit inventories_url

    click_link inventory.name

    expect(current_path).to eq(inventory_path(inventory))
  end
end