def event_attributes(overrides = {})
  {
    title: "Test",
    date_start: 1.day.from_now,
    date_end: 2.day.from_now,
    details: "this is test event"
  }.merge(overrides)
end