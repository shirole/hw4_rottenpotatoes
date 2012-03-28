Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
      Movie.create!(movie)
   end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  #pending # express the regexp above with the code you wish you had
  arg2 == Movie.find_by_title(arg1).director
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split.each do |name|
    checkbox = "ratings[#{name}]"
    if uncheck == "un"
      step "I uncheck \"#{checkbox}\""  
    else
      step "I check \"#{checkbox}\""
    end
  end

end

Then /I should see all of the movies/ do
  #HTML_table.rows == Movie.count
   assert all("table#movies tr").count - 1 == Movie.count
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #assert false, "Unimplmemented"
  #puts page.body
  assert page.body =~ /#{e1}.*#{e2}/im

end