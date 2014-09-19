require 'rails_helper'

describe "View an individual events" do
  it "shows the event's details" do
    event = Event.create(
                            title: "Event",
                            date_start: "2014/10/24",
                            date_end: "2014/10/24",
                            details: "this is test event"
                            )

      visit event_url(event)

      expect(page).to have_text(event.title)
      expect(page).to have_text(event.date_start)
      expect(page).to have_text(event.date_end)
      expect(page).to have_text(event.details[0..10])
  end
end