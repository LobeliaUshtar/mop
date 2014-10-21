require 'rails_helper'

describe "Filtering events" do
  before do
    @event_ended = Event.create!(event_attributes(date_start: 2.weeks.ago, date_end: 1.week.ago))
    @event_now = Event.create!(event_attributes)
    @event_upcoming = Event.create!(event_attributes(date_start: 1.week.from_now, date_end: 2.weeks.from_now))
  end

  it "shows all events happening now" do
    visit events_url

    click_link "Happening Now"

    expect(current_path).to eq("/events")

    expect(page).not_to have_text(@event_ended.title)
    expect(page).to have_text(@event_now.title)
    expect(page).not_to have_text(@event_upcoming.title)
  end

  it "shows all events" do
    visit events_url

    click_link "All Events"

    expect(current_path).to eq("/events/filter/all")

    expect(page).to have_text(@event_ended.title)
    expect(page).to have_text(@event_now.title)
    expect(page).to have_text(@event_upcoming.title)
  end

  it "shows all ended events" do
    visit events_url

    click_link "Ended"

    expect(current_path).to eq("/events/filter/ended")

    expect(page).to have_text(@event_ended.title)
    expect(page).not_to have_text(@event_now.title)
    expect(page).not_to have_text(@event_upcoming.title)
  end

  it "shows all upcoming events" do
    visit events_url

    click_link "Upcoming"

    expect(current_path).to eq("/events/filter/upcoming")

    expect(page).not_to have_text(@event_ended.title)
    expect(page).not_to have_text(@event_now.title)
    expect(page).to have_text(@event_upcoming.title)
  end
end