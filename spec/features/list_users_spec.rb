require 'rails_helper'

describe "Viewing the list of users" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "shows all the users" do
    user1 = User.create(user_attributes)
    user2 = User.create(user_attributes)
    user3 = User.create(user_attributes)

    sign_in(user1)

    visit users_url

    expect(page).to have_link(user1.name)
    expect(page).to have_link(user2.name)
    expect(page).to have_link(user3.name)
  end

end