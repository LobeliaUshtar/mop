require 'rails_helper'

describe "Filtering users" do
  context "while an admin" do
    before do
      @user1 = User.create!(user_attributes(name: "Larry", email: "larry@example.com"))
      @user2 = User.create!(user_attributes(name: "Moe",   email: "moe@example.com"))
      @user3 = User.create!(user_attributes(name: "Curly",   email: "curly@example.com", admin: true))
      @admin = User.create!(user_attributes(admin: true))
      sign_in(@admin)
    end

    it "shows all users" do
    visit users_url

    click_link "Our Volunteers"

    expect(current_path).to eq("/users")

    expect(page).to have_text(@user1.name)
    expect(page).to have_text(@user2.name)
    expect(page).to have_text(@user3.name)

  end

    it "shows all site admin users" do
      visit users_url

      click_link "Site Admins"

      expect(current_path).to eq("/users/filter/site_admin")

      expect(page).not_to have_text(@user1.name)
      expect(page).not_to have_text(@user2.name)
      expect(page).to have_text(@user3.name)
    end

    it "shows all regular users" do
      visit users_url

      click_link "Regulars"

      expect(current_path).to eq("/users/filter/regular")

      expect(page).to have_text(@user1.name)
      expect(page).to have_text(@user2.name)
      expect(page).not_to have_text(@user3.name)
    end
  end
end