require('spec_helper')

describe Employee do
  it 'creates an employee' do
    billy = Employee.create(:name => 'Billy')
    expect(Employee.all).to eq([billy])
    expect(Employee.all[0].name).to eq('Billy')
  end
end
