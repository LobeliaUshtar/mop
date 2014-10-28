require 'rails_helper'

RSpec.describe Event, :type => :model do
  it "requires a title" do
    event = Event.new(title: "")
    
    expect(event.valid?).to eq(false)
    expect(event.errors[:title].any?).to eq(true)
  end

  it "requires a end date" do
    event = Event.new(date_start: "")
    
    expect(event.valid?).to eq(false)
    expect(event.errors[:date_start].any?).to eq(true)
  end

  it "requires an end date" do
    event = Event.new(date_end: "")
    
    expect(event.valid?).to eq(false)
    expect(event.errors[:date_end].any?).to eq(true)
  end

  it "requires details" do
    event = Event.new(details: "")
    
    expect(event.valid?).to eq(false)
    expect(event.errors[:details].any?).to eq(true)
  end

  it "is over when the end date is in the past" do
    event = Event.create(event_attributes(date_end: 3.months.ago))
    
    expect(Event.ended).to include(event)
  end

  it "returns current events ordered with the older event first" do
    event1 = Event.create(event_attributes(date_start: 1.week.ago,date_end: 1.week.from_now))
    event2 = Event.create(event_attributes(date_start: 1.week.ago,date_end: 2.week.from_now))
    event3 = Event.create(event_attributes(date_start: 2.week.ago,date_end: 1.day.from_now))

    expect(Event.happening_now).to eq([event3, event1, event2])
  end

  it "generates a slug when it's created" do
    event = Event.create!(event_attributes(title: "X-Men: The Last Stand"))

    expect(event.slug).to eq("x-men-the-last-stand")
  end

  it "requires a unique title" do
    event1 = Event.create!(event_attributes)

    event2 = Event.new(title: event1.title)
    event2.valid? # populates errors
    expect(event2.errors[:title].first).to eq("has already been taken")
  end

  it "requires a unique slug" do
    event1 = Event.create!(event_attributes)

    event2 = Event.new(slug: event1.slug)
    event2.valid? # populates errors
    expect(event2.errors[:slug].first).to eq("has already been taken")
  end
end