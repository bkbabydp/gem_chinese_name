RSpec.describe ChineseName do
  it 'has a version number' do
    expect(ChineseName::VERSION).not_to be nil
  end

  it 'has FAMILY_NAME' do
    expect(ChineseName::FAMILY_NAME).not_to be nil
  end

  it 'has GIVEN_NAME' do
    expect(ChineseName::GIVEN_NAME).not_to be nil
  end

  it 'runs family_name' do
    expect(described_class.family_name).not_to be nil
  end

  it 'runs given_name' do
    expect(described_class.given_name).not_to be nil
  end
end
