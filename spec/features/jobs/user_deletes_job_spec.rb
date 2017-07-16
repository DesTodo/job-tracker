require "rails_helper"

RSpec.feature "User deletes job" do
  scenario "and they see list of jobs with confirmation message" do
    @company = Company.create(name: "Government")
    @job = @company.jobs.create(title: "Clerk", level_of_interest: 40, city: 'Houston')

    visit company_jobs_path(@company, @job)

    expect(page).to have_content("Clerk")
    within('li') do
      find('a[rel="nofollow"]').click
    end

    expect(page).to have_content("#{@job.title} was successfully deleted!")

  end
end
