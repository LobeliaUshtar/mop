require 'rails_helper'

describe "Deleting an event" do 
  it "destroys the event and shows the event listing without the deleted event" do
    event = Event.create(event_attributes)

    visit event_path(event)
    
    click_link 'Delete'
    
    expect(current_path).to eq(events_path)
    page.has_content?(event.title)
    expect(page).to have_text("Event successfully deleted!")
  end
end