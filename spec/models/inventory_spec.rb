require 'rails_helper'

RSpec.describe Inventory, :type => :model do
  it "accepts shop values of 1 through 5" do
    shop = [1, 2, 3, 4, 5, 6, 7, 8]
    shop.each do |x|
      inventory = Inventory.new(shop: x)

      inventory.valid?

      expect(inventory.errors[:shop].any?).to eq(false)
    end
  end

  it "rejects invalid shop values" do
    shop = [-1, 0, 9]
    shop.each do |x|
      inventory = Inventory.new(shop: x)

      inventory.valid?

      expect(inventory.errors[:shop].any?).to eq(true)
      expect(inventory.errors[:shop].first).to eq("must be between 1 and 8")
    end
  end
  
  context "low query" do
    before do
      @inventory1 = Inventory.create(inventory_attributes(count: 5))
      @inventory2 = Inventory.create(inventory_attributes(count: 20))
      @inventory3 = Inventory.create(inventory_attributes(count: 1))
      @inventory4 = Inventory.create(inventory_attributes(count: 50))
      @inventory5 = Inventory.create(inventory_attributes(count: 1))
      @inventory6 = Inventory.create(inventory_attributes(count: 100))
    end

    it "returns all inventory items with a count equal to or below 10" do
      expect(Inventory.low).to eq([@inventory3, @inventory5, @inventory1])
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