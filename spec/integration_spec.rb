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
