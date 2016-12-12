ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('rspec')
require('pry')
require('pg')
require('employee')
require('division')

RSpec.configure do |config|
  config.after(:each) do
    Employee.all().each() do |employee|
      employee.destroy()
    end
    Division.all().each() do |division|
      division.destroy()
    end
  end
end
