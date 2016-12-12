require('spec_helper')

describe Division do
  before do
    @hr = Division.create(:name => 'Test')
  end
  it 'creates a division' do

    expect(Division.all[3].name).to eq('Test')
  end
  it 'tells which employees are in it' do
    billy = Employee.create(:name => 'Billy', :division_id => @hr.id)
    expect(@hr.employees).to eq([billy])
  end
end
