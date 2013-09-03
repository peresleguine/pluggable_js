When(/^I go to list of posts$/) do
  visit posts_path
end

When(/^I go to new post$/) do
  visit new_post_path
end

Then(/^I should see '(.*?)'$/) do |text|
  page.should have_content text
end

And(/^I should not see '(.*?)'$/) do |text|
  page.should_not have_content text
end
