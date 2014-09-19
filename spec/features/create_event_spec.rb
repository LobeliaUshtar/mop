require 'rails_helper'

describe "Creating a new event" do 
  it "saves the event and shows the new event's details" do    
    visit events_url
    
    click_link 'Add New Event'
    
    expect(current_path).to eq(new_event_path)
    
    fill_in "Title", with: "New Event Title"
    fill_in "Date start", with: (Time.now.year - 1).to_s
    fill_in "Date end", with: (Time.now.year - 1).to_s
    fill_in "Detail", with: "Superheroes saving the world from villains"
     
    click_button 'Create Event'

    expect(current_path).to eq(event_path(Event.last))   
    
    expect(page).to have_text('New Event Title')
  end
end