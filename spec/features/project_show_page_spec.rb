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
end


# User Story 1 of 3
# ​
# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
