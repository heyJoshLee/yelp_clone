module ApplicationHelper

  def category_dropdown_options
    options_array = []
    Category.all.each_with_index do |category, index|
      options_array << [category.name, index]
    end
    options_array
  end
end

