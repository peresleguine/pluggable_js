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
  page.should have_content 'Dragoon: Make use of me.'
  page.should have_content 'High Templar: It shall be done.'
  page.should have_content 'Archon: We burn...'
end

Then(/^I should see content with 'array_of_hashes'$/) do
  page.should have_content 'Scout: Awaiting command.'
  page.should have_content 'Arbiter: We feel your presence.'
  page.should have_content 'Carrier: Affirmative.'
end
