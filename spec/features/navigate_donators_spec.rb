require 'rails_helper'

describe "Navigating donators" do
  it "allows navigation from the detail page to the listing page" do
    donator = Donator.create(donator_attributes)

    visit donator_url(donator)

    click_link "Our Donators"

    expect(current_path).to eq(donators_path)
  end

  it "allows navigation from the listing page to the detail page" do
    donator = Donator.create(donator_attributes)

    visit donators_url

    click_link donator.name

    expect(current_path).to eq(donator_path(donator))
  end
end