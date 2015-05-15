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

# describe('path to add, update, and delete a band', {:type => :feature}) do
#   it('allows a user to suggest, change the name of, or delete a band') do
#     visit('/')
#     click_link('Suggest a new band!')
#     fill_in('Band Name', :with =>'Faucet Monkeys')
#     click_button('ADD')
#     click_link('Enter Edit Mode')
#     fill_in('Update Band Name', :with =>'The Drop')
#     click_button('Submit')
#     click_button('CANCEL CONTRACT')
#     expect(page).to have_content('That band sucked, anyway.')
#   end
# end
