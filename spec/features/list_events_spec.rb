require 'rails_helper'

describe "Viewing the list of events" do
  
  it "shows the events" do
    event1 = Event.create(event_attributes)
    event2 = Event.create(event_attributes)
    event3 = Event.create(event_attributes)

    visit events_url

    expect(page).to have_text(event1.title)
    expect(page).to have_text(event2.title)
    expect(page).to have_text(event3.title)

    expect(page).to have_text(event1.date_start)
    expect(page).to have_text(event1.date_end)
    expect(page).to have_text(event1.details[0..10])
  end

  it "does not show an event that is over" do
    event = Event.create(event_attributes(date_start: 3.weeks.ago, date_end: 2.weeks.ago))

    visit events_url

    expect(page).not_to have_text(event.title)
  end
end