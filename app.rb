require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/division')
require('./lib/employee')
require('pry')
require('pg')

get '/' do
  @divisions = Division.all
  erb(:index)
end

post('/divisions/new') do
  Division.create(:name => params['name'])
  @divisions = Division.all
  erb(:index)
end

get ('/division/:id/new') do
  @division = Division.find(params['id'])
  erb(:division)
end

post('/division/:id/new') do
  Employee.create(:name => params['name'], :division_id => params['id'])
  @division = Division.find(params['id'])
  erb(:division)
end










# if Division.all == []
  departments = ['HR', 'IT', 'Sales']
  departments.each do |division|
    Division.create(:name => "#{division}")
  end
# end
