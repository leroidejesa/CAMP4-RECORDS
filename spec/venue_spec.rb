require('spec_helper')

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }
  it { should validate_presence_of(:description) }
end
