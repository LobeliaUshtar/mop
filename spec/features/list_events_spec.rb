require 'rails_helper'

describe "Viewing the list of events" do
  
  it "shows the events" do
    event1 = Event.create(
                          title: "Event 1",
                          date_start: "2014/10/24",
                          date_end: "2014/10/24",
                          details: "this is test event 1"
                          )

    event2 = Event.create(
                          title: "Event 2",
                          date_start: "2014/10/24",
                          date_end: "2014/10/24",
                          details: "this is test event 2"
                          )

    event3 = Event.create(
                          title: "Event 3",
                          date_start: "2014/10/24",
                          date_end: "2014/10/24",
                          details: "this is test event 3"
                          )

    visit events_url

    expect(page).to have_text("3 Events")
    expect(page).to have_text(event1.title)
    expect(page).to have_text(event2.title)
    expect(page).to have_text(event3.title)

    expect(page).to have_text(event1.date_start)
    expect(page).to have_text(event1.date_end)
    expect(page).to have_text(event1.details[0..10])
  end
  
end