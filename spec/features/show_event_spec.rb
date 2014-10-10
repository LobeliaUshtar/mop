require 'rails_helper'

describe "View a specific event" do
  it "shows the event's details" do
    event = Event.create(event_attributes)

    visit event_url(event)

    expect(page).to have_text(event.title)
    expect(page).to have_text(event.date_start)
    expect(page).to have_text(event.date_end)
    expect(page).to have_text(event.details[0..10])
  end
end