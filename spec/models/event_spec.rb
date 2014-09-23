require 'rails_helper'

describe "An event" do
  it "is over when the end date is in the past" do
    event = Event.create(event_attributes(date_end: 3.months.ago))
    expect(Event.ended).to include(event)
  end

  it "returns current events ordered with the older event first" do
    event1 = Event.create(event_attributes(date_start: 1.week.from_now))
    event2 = Event.create(event_attributes(date_start: 2.week.from_now))
    event3 = Event.create(event_attributes(date_end: 1.day.from_now))
    expect(Event.current_upcoming).to eq([event3, event1, event2])
  end
end