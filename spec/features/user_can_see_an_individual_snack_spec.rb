require 'rails_helper'

feature 'When a user visits a item show page' do

  before(:each)do
    owner = Owner.create(name: "Sam's Snacks")
    @dons  = owner.machines.create(location: "Don's Mixed Drinks")
    @turings = owner.machines.create(location: "Turing")
    @snack_1_1 = @dons.snacks.create(name: "Pop Rocks", price: 1.50)
    @snack_2_1 = @dons.snacks.create(name: "White Castle Burger", price: 3.50)
  end

  scenario 'they can see information about that snack' do
    visit snack_path(@snack_1)
    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content(@snack_1.price)
  end

  scenario 'they can see locations with that snack' do
    visit snack_path(@snack_1)
    expect(page).to have_content(@dons.location)
  end

end
