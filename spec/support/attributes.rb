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
    phone: "555-555-5555",
    admin: false
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

def donator_attributes(overrides ={})
  {
    name: "Gabby's Bagels",
    website: "www.gabby.com",
    description: "blah blah blah blah blah",
    logo_file_name: "gabby.gif",
    address: "123 456 Avenue, Budd Lake, NJ 07828",
    phone: "555-555-5555",
    current: true
  }.merge(overrides)
end