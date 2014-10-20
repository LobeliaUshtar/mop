def event_attributes(overrides = {})
  random_number = (0..9).to_a.shuffle[0..5].join
  {
    title: "Test #{random_number}",
    date_start: 1.day.ago,
    date_end: 2.days.from_now,
    details: "testing, test, test, test, test"
  }.merge(overrides)
end

def user_attributes(overrides = {})
  random_number = (0..9).to_a.shuffle[0..5].join
  {
    name: "Example User #{random_number}",
    email: "user#{random_number}@example.com",
    password: "secret",
    password_confirmation: "secret",
    address: "123 ABC Street, ZYX, NJ, 55555",
    phone: "555-555-5555",
    admin: false
  }.merge(overrides)
end

def inventory_attributes(overrides = {})
  {
    name: "tomatoes",
    count: 10,
    shop: 3
  }.merge(overrides)
end

def donator_attributes(overrides ={})
  random_number = (0..9).to_a.shuffle[0..5].join
  {
    name: "Gabby's Bagels #{random_number}",
    website: "www.gabby.com",
    email: "gabby@example.com",
    description: "blah blah blah blah blah",
    donation: "doggy bagel cookies",
    logo_link: "gabby.gif",
    address: "123 456 Avenue, Budd Lake, NJ 07828",
    phone: "555-555-5555",
    hours: "12am - 12pm",
    current: true
  }.merge(overrides)
end