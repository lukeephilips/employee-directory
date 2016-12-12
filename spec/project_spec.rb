require('spec_helper')

describe Project do
  before do
    @dishes = Project.create(:name => 'dishes', :done => false, :due_date => '2016-12-24')
  end
  it 'creates a division' do

    expect(Project.all).to eq([@dishes])
  end
  it 'tells which employees are on it' do
    billy = Employee.create(:name => 'Billy', :project_id => @dishes.id)
    expect(@dishes.employees).to eq([billy])
  end
end
