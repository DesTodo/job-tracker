require "rails_helper"

RSpec.feature "User creates a new category" do
  scenario "and they see page with newly created category title" do
    # category = Category.create(title: "Education")
    # category = Categpry.create(title: "Labor")

    visit new_category_path

    fill_in "category[title]", with: "Education"
    click_button "Create"

    expect(page).to have_content("Education")
  end
end
