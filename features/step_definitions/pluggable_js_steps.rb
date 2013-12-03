When(/^I go to posts 'index'$/) do
  visit posts_path
end

When(/^I go to posts 'search'$/) do
  visit search_posts_path
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

Then(/^I should see content with 'string'$/) do
  page.should have_content 'My life for aiur.'
end

Then(/^I should see content with 'integer'$/) do
  page.should have_content 'You have not enough minerals.'
end

Then(/^I should see content with 'boolean'$/) do
  page.should have_content 'Base is under attack.'
end

Then(/^I should see content with 'array'$/) do
  page.should have_content 'Nuclear launch detected.'
end

Then(/^I should see content with 'hash'$/) do
  page.should have_content 'Zealots: 12.'
  page.should have_content 'Dragoons: 6.'
  page.should have_content 'Archons: 1.'
end
