When(/^I go to posts 'index'$/) do
  visit pluggable_js_posts_path
end

When(/^I go to posts 'search'$/) do
  visit search_pluggable_js_posts_path
end

When(/^I go to new post$/) do
  visit new_pluggable_js_post_path
end

Then(/^I should see '(.*?)'$/) do |text|
  expect(page).to have_content(text)
end

And(/^I should not see '(.*?)'$/) do |text|
  expect(page).not_to have_content(text)
end

Then(/^I should see content with 'string'$/) do
  expect(page).to have_content('My life for aiur.')
end

Then(/^I should see content with 'integer'$/) do
  expect(page).to have_content('You have not enough minerals.')
end

Then(/^I should see content with 'boolean'$/) do
  expect(page).to have_content('Base is under attack.')
end

Then(/^I should see content with 'array'$/) do
  expect(page).to have_content('Nuclear launch detected.')
end

Then(/^I should see content with 'hash'$/) do
  expect(page).to have_content('Dragoon: Make use of me.')
  expect(page).to have_content('High Templar: It shall be done.')
  expect(page).to have_content('Archon: We burn...')
end

Then(/^I should see content with 'array_of_hashes'$/) do
  expect(page).to have_content('Scout: Awaiting command.')
  expect(page).to have_content('Arbiter: We feel your presence.')
  expect(page).to have_content('Carrier: Affirmative.')
end
