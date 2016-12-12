require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('shows content') do
    visit ('/')
    expect(page).to have_content('Employee Directory')
  end
end

describe('navigates through employee creation and modification', {:type => :feature}) do
  it('shows employees') do
    visit ('/')
    expect(page).to have_content('Employee Directory')
    fill_in('name', :with => "Lab")
    click_button("Add")
    expect(page).to have_content('Lab')
  end
end
