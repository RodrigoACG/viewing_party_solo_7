require "rails_helper"

RSpec.describe "Discover index page" do
  describe '#US 1' do

    it 'should have a button to top movies' do
      @u1 = User.create!(name: "Martin", email: "martin12@gmail.com")
      # When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
      visit user_discover_index_path(@u1.id)
      # save_and_open_page
      # I should see
      # - a Button to Discover Top Rated Movies
      expect(page).to have_button("Top Rated Movies")
    end
    
    it "has a text field to search by title" do 
      @u1 = User.create!(name: "Martin", email: "martin12@gmail.com")
      # - a text field to enter keyword(s) to search by movie title
      visit user_discover_index_path(@u1)
      expect(page).to have_field(:title)
    end
    
    it "has a button to search by movie title" do 
      # - a Button to Search by Movie Title
      @u1 = User.create!(name: "Martin", email: "martin12@gmail.com")
      visit user_discover_index_path(@u1)
      expect(page).to have_button("Search")

    end
  end
end