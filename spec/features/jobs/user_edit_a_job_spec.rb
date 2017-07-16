require 'rails_helper'
require 'pry'

RSpec.feature "User edits an existing job for a company" do
  scenario "and they can see the updated job title" do
    @company = Company.create(name: "Turing")
    job = @company.jobs.create(title: "Junior Developer", level_of_interest: 50, city: "Denver")

    visit company_jobs_path(job.company_id)
    within("li") do
        find('a[href*="edit"]').click
    end
    #binding.pry
    expect(job.title).to eq("Junior Developer")

    fill_in "job[title]", with: "Senior Software Engineer"
    fill_in "job[level_of_interest]", with: 80
    fill_in "City", with: "Boulder"
    click_button "Update"

    expect(current_path).to eq("/companies/#{@company.id}/jobs")
    expect(page).to_not have_content("Junior Developer")
    expect(page).to have_content("Senior Software Engineer")
  end
end
