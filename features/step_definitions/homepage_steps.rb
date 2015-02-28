Given(/^I am on the homepage$/) do
  visit('/')
end

Given(/^I want to find out more about Oodls$/) do
  expect(page).to have_content('About Oodls')
end

When(/^I click on About Oodls$/) do
  click_link('About Oodls')
end

Then(/^I should be able to learn about Oodls$/) do
  expect(page).to have_content('Welcome to the About Oodls page!')
end
