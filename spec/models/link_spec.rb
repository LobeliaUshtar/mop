require 'rails_helper'

RSpec.describe Link, :type => :model do
  it "generates a slug when it's created" do
    link = Link.create!(link_attributes(name: "X-Men: The Last Stand"))

    expect(link.slug).to eq("x-men-the-last-stand")
  end

  it "requires a unique name" do
    link1 = Link.create!(link_attributes)

    link2 = Link.new(name: link1.name)
    link2.valid? # populates errors
    expect(link2.errors[:name].first).to eq("has already been taken")
  end

  it "requires a unique slug" do
    link1 = Link.create!(link_attributes)

    link2 = Link.new(slug: link1.slug)
    link2.valid? # populates errors
    expect(link2.errors[:slug].first).to eq("has already been taken")
  end
end