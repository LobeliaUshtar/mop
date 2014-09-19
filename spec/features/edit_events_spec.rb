require 'rails_helper'

describe "Editing an event" do
  
  it "updates the event and shows the event's updated details" do
    event = Event.create(event_attributes)
    
    visit event_url(event)
    
    click_link 'Edit'
    
    expect(current_path).to eq(edit_event_path(event))
        
    expect(find_field('Title').value).to eq(event.title)

    fill_in 'Title', with: "Updated Event Title"
    
    click_button 'Update Event'
    
    expect(current_path).to eq(event_path(event))

    expect(page).to have_text('Updated Event Title')
  end
  
end