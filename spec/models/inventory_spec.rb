require 'rails_helper'

describe "An inventory" do

  it "accepts shop values of 1 through 5" do
    shop = [1, 2, 3, 4, 5, 6, 7, 8]
    shop.each do |x|
      inventory = Inventory.new(shop: x)

      inventory.valid?

      expect(inventory.errors[:shop].any?).to eq(false)
    end
  end

  it "rejects invalid shop values" do
    shop = [-1, 0, 9]
    shop.each do |x|
      inventory = Inventory.new(shop: x)

      inventory.valid?

      expect(inventory.errors[:shop].any?).to eq(true)
      expect(inventory.errors[:shop].first).to eq("must be between 1 and 8")
    end
  end
  
=begin
  context "recent query" do
    before do
      @movie1 = Movie.create(movie_attributes(released_on: 3.months.ago))
      @movie2 = Movie.create(movie_attributes(released_on: 2.months.ago))
      @movie3 = Movie.create(movie_attributes(released_on: 1.months.ago))
      @movie4 = Movie.create(movie_attributes(released_on: 1.week.ago))
      @movie5 = Movie.create(movie_attributes(released_on: 1.day.ago))
      @movie6 = Movie.create(movie_attributes(released_on: 1.hour.ago))
      @movie7 = Movie.create(movie_attributes(released_on: 1.day.from_now))
    end

    it "returns a specified number of released movies ordered with the most recent movie first" do
      expect(Movie.recent(2)).to eq([@movie6, @movie5])
    end

    it "returns a default of 5 released movies ordered with the most recent movie first" do
      expect(Movie.recent).to eq([@movie6, @movie5, @movie4, @movie3, @movie2])
    end
  end
=end
end