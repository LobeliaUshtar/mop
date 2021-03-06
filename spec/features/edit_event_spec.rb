require 'rails_helper'

describe "Editing an event" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end
  
  it "updates the event and shows the event's updated details" do
    event = Event.create(event_attributes)
    
    visit event_url(event)
    
    click_link 'Edit Event'
    
    expect(current_path).to eq(edit_event_path(event))
        
    expect(find_field('Title').value).to eq(event.title)

    fill_in 'Title', with: "Updated Event Title"
    
    click_button 'Update Event'
    
    expect(current_path).to eq(event_path(event))

    expect(page).to have_text('Updated Event Title')

    expect(page).to have_text('Event successfully updated!')
  end
  
  it "does not update the event if it's invalid" do
    event = Event.create(event_attributes)
    
    visit edit_event_url(event)
    
    fill_in 'Title', with: " "
    
    click_button 'Update Event' 
        
    expect(page).to have_text('error')
  end
end