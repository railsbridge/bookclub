# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def cloud(genres)
    return if genres.blank?
    output = ""
    mid = genres.collect {|i| i.books.count}.max / 1.5

    genres.each do |g|
      size = 100 * g.books.count / mid
      size = 75 if size < 75
      output << link_to(g.name, {:controller => "genres", :action => "show", :id => g}, :style => "font-size: #{size}%") << " "
    end

    return output
    end


end

