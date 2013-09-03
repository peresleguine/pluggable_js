When(/^I go to list of posts$/) do
  visit posts_path
end

Then(/^I should see "(.*?)"$/) do |text|
  print page.html
  expect(page).to have_content 'My life for aiur!'
end
