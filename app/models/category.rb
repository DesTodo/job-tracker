class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy

  def flash(url)
    if url.include?("new")
      flash[:alert] = "Category with the title: #{@category.title} already exists! You can create a new one."
    else
      flash[:success] = "new category created with title: #{@category.title}"
    end
  end
end
