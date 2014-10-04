def event_attributes(overrides = {})
  {
    title: "Test",
    date_start: 1.day.from_now,
    date_end: 2.day.from_now,
    details: "testing, test, test, test, test"
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    password: "secret",
    password_confirmation: "secret",
    address: "123 ABC Street, ZYX, NJ, 55555",
    phone: "555-555-5555"
  }.merge(overrides)
end

def item_attributes(overrides = {})
  {
    name: "tomatoes",
    variety: "diced",
    category: "tomato",
    count: "50",
    shop: "3"
    }.merge(overrides)
end