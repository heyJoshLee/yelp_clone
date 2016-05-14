module ApplicationHelper

  def category_dropdown_options
    options_array = []
    Category.all.each_with_index do |category, index|
      options_array << [category.name, category.id]
    end
    options_array
  end

  def all_categories
    Category.all
  end

end

