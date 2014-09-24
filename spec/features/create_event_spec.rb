require 'rails_helper'

describe "Creating a new event" do 
  it "first opens the new event page" do
    visit events_url
    
    click_link 'Add New Event'
    
    expect(current_path).to eq(new_event_path)
  end

  it "saves the event and shows the new event's details" do    
    visit events_url
    
    click_link 'Add New Event'
    
    expect(current_path).to eq(new_event_path)
    
    fill_in "Title", with: "New Title"
    fill_in "Date start", with: "Friday, Oct 24, 2014"
    fill_in "Date end", with: "Friday, Oct 24, 2014"
    fill_in "Details", with: "Superheroes saving the world from villains"
     
    click_button 'Create Event'

    expect(current_path).to eq(event_path(Event.last))
    
    expect(page).to have_text('New Title')

    expect(page).to have_text('Event successfully created!')
  end

  it "does not save the event if it's invalid" do
    visit new_event_url
    
    expect { 
      click_button 'Create Event' 
    }.not_to change(Event, :count)
    
    expect(current_path).to eq(events_path)   
    expect(page).to have_text('error')
  end
end