require 'rails_helper'

RSpec.describe Donator, :type => :model do
  it "requires a name" do
    donator = Donator.new(name: "")
    
    expect(donator.valid?).to eq(false)
    expect(donator.errors[:name].any?).to eq(true)
  end

  it "generates a slug when it's created" do
    donator = Donator.create!(donator_attributes(name: "X-Men: The Last Stand"))

    expect(donator.slug).to eq("x-men-the-last-stand")
  end

  it "requires a unique name" do
    donator1 = Donator.create!(donator_attributes)

    donator2 = Donator.new(name: donator1.name)
    donator2.valid? # populates errors
    expect(donator2.errors[:name].first).to eq("has already been taken")
  end

  it "requires a unique slug" do
    donator1 = Donator.create!(donator_attributes)

    donator2 = Donator.new(slug: donator1.slug)
    donator2.valid? # populates errors
    expect(donator2.errors[:slug].first).to eq("has already been taken")
  end
end