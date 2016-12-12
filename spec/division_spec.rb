require('spec_helper')

describe Division do
  before do
    @hr = Division.create(:name => 'HR')
  end
  it 'creates a division' do

    expect(Division.all).to eq([@hr])
    expect(Division.all[0].name).to eq('HR')
  end
  it 'tells which employees are in it' do
    billy = Employee.create(:name => 'Billy', :division_id => @hr.id)
    expect(@hr.employees).to eq([billy])
  end
end
