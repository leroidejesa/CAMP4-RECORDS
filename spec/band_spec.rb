require('spec_helper')

describe(Band) do
  it { should have_and_belong_to_many(:venues) }
  it { should validate_presence_of(:description) }


  it('capitalizes every word in a band title.') do
    test_band = Band.create({:description => "tame impala"})
    expect(test_band.description).to(eq("Tame Impala"))
  end

end
