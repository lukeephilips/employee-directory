require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/division')
require('./lib/employee')
require('./lib/project')
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

get('/employee/:id') do
  @projects = Project.all
  @employee = Employee.find(params.fetch('id'))
  erb(:employee)
end

patch('/employee/:id/edit') do
  employee = Employee.find(params.fetch('id'))
  name = params.fetch("name")
  if name != ''
    employee.update(:name => name)
  end
  project_id = params.fetch("projects")

  employee.update(:project_id => project_id)
  @division = Division.find(params.fetch('division_id'))
  erb(:division)
end

delete('/employee/:id/delete') do
  employee = Employee.find(params.fetch('id'))
  employee.destroy
  @division = Division.find(params.fetch('division_id'))
  erb(:division)
end




if Project.all == []
  projects = [['Convention', "2017-01-01", false], ['Web Redesign', "2017-03-21", false],['Winter Branding', "2016-12-29", false]]
  projects.each do |project|
    Project.create(:name => "#{project[0]}", :due_date => "#{project[1]}", :done => project[2])
  end
end

if Division.all == []
  departments = ['HR', 'IT', 'Sales']
  departments.each do |division|
    Division.create(:name => "#{division}")
  end
end
