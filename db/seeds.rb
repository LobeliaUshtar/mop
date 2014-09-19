# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create!([
  {
    title: "Test Event",
    date_start: "2014/10/24",
    date_end: "2014/10/24",
    details: "This is test event.  It should be deleted once we have a whole lot more events to list on the website."
  }
])