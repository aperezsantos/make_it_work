require 'rails_helper'

RSpec.describe "Project Show Page", type: :feature do
  describe "when I visit a project's show page" do
    it "I see it's name, material, and the theme of the challenge" do
      challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      project_1 = challenge.projects.create(name: "News Chic", material: "Newspaper")

      visit "/projects/#{project_1.id}"

      expect(current_path).to eq("/projects/#{project_1.id}")
      expect(page).to have_content("Project: #{project_1.name}")
      expect(page).to have_content("Material: #{project_1.material}")
      expect(page).to have_content("Challenge Theme: #{challenge.theme}")
    end
  end

  it "I see the total count of contestants on this project" do
    challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project_1 = challenge.projects.create(name: "News Chic", material: "Newspaper")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)

    visit "/projects/#{project_1.id}"

    expect(page).to have_content("Number of Contestants: 2")
  end

  # User Story 3 of 3
  # As a visitor,
  # When I visit a project's show page
  # I see a count of the number of contestants on this project
  # ​
  # (e.g.    Litfit
  #     Material: Lamp Shade
  #   Challenge Theme: Apartment Furnishings
  #   Number of Contestants: 3 )
  # ```
end
