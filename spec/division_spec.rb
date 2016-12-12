require('spec_helper')

describe Division do
  it 'creates a division' do
    hr = Division.create(:name => 'HR')
    expect(Division.all).to eq([hr])
    expect(Division.all[0].name).to eq('HR')
  end
end
