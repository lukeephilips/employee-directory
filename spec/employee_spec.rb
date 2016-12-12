require('spec_helper')

describe Employee do
  before do
    @billy = Employee.create(:name => 'Billy')
  end
  it 'creates an employee' do
    expect(Employee.all).to eq([@billy])
    expect(Employee.all[0].name).to eq('Billy')
  end
  it 'tells which division an employee belongs to' do
    hr = Division.create(:name => 'HR')
    danny = Employee.create(:name => 'Danny', :division_id => hr.id)
    expect(hr.employees).to eq([danny])
  end
end
