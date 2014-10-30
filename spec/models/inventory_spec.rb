require 'rails_helper'

RSpec.describe Inventory, :type => :model do
  context "low query" do
    before do
      @inventory1 = Inventory.create(inventory_attributes(name: "peas6", running_low: true))
      @inventory2 = Inventory.create(inventory_attributes(name: "peas5", running_low: false))
      @inventory3 = Inventory.create(inventory_attributes(name: "peas4", running_low: true))
      @inventory4 = Inventory.create(inventory_attributes(name: "peas3", running_low: false))
      @inventory5 = Inventory.create(inventory_attributes(name: "peas2", running_low: true))
      @inventory6 = Inventory.create(inventory_attributes(name: "peas1", running_low: false))
    end

    it "returns all inventory items that are running low" do
      expect(Inventory.low).to eq([@inventory5, @inventory3, @inventory1])
    end
  end

  it "generates a slug when it's created" do
    inventory = Inventory.create!(inventory_attributes(name: "X-Men: The Last Stand"))

    expect(inventory.slug).to eq("x-men-the-last-stand")
  end

  it "requires a unique name" do
    inventory1 = Inventory.create!(inventory_attributes)

    inventory2 = Inventory.new(name: inventory1.name)
    inventory2.valid? # populates errors
    expect(inventory2.errors[:name].first).to eq("has already been taken")
  end

  it "requires a unique slug" do
    inventory1 = Inventory.create!(inventory_attributes)

    inventory2 = Inventory.new(slug: inventory1.slug)
    inventory2.valid? # populates errors
    expect(inventory2.errors[:slug].first).to eq("has already been taken")
  end
end