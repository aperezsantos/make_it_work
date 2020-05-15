require 'rails_helper'

RSpec.describe "Contestants Index Page" do
  describe "when I visit the contestants index page" do
    it "I see a list of all contestants and their respectice projects" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

      ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
      ContestantProject.create(contestant_id: erin.id, project_id: boardfit.id)

      visit "/contestants"

      expect(page).to have_content(kentaro.name)
      expect(page).to have_content(erin.name)
      expect(page).to have_content("Boardfit")
      expect(page).to have_content("Upholstery")      
    end
  end
end
