require('spec_helper')

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }
  it { should validate_presence_of(:description) }

  it('capitalizes every word in a venue title.') do
    test_venue = Venue.create({:description => "the echoplex"})
    expect(test_venue.description).to(eq("The Echoplex"))
  end

end
