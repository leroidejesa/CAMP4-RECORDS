require('spec_helper')

describe('path to add, update, and delete a band', {:type => :feature}) do
  it('allows a user to suggest, change the name of, or delete a band') do
    visit('/')
    click_link('Suggest a new band!')
    fill_in('Band Name', :with =>'Faucet Monkeys')
    click_button('ADD')
    click_link('Enter Edit Mode')
    fill_in('Update Band Name', :with =>'The Drop')
    click_button('Submit')
    click_button('CANCEL CONTRACT')
    expect(page).to have_content('That band sucked, anyway.')
  end
end

describe('path to add a venue', {:type => :feature}) do
  it('allows a user to add a venue') do
    visit('/')
    click_link('Venue List')
    fill_in('New spot open up? Help us out, add it to the list', :with =>'The Echo')
    click_button('Update')
    click_link('Go Back')
    click_link('Suggest a new band!')
    fill_in('Band Name', :with =>'Faucet Monkeys')
    click_button('ADD')
    click_link('Enter Edit Mode')
    click_link('Edit Venue History')
    expect(page).to have_content('The Echo')
  end
end
