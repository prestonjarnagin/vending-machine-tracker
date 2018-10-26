require 'rails_helper'

feature 'When a user visits a vending machine show page' do

  before(:each)do
    owner = Owner.create(name: "Sam's Snacks")
    @dons  = owner.machines.create(location: "Don's Mixed Drinks")

  end
  scenario 'they see the location of that machine' do
    visit machine_path(@dons)
    expect(page).to have_content("Location: Don's Mixed Drinks")
  end

  scenario 'they see the snacks and prices associated with that machine' do
    @dons.snacks.create(name: "White Castle Burger", price: 3.50)
    @dons.snacks.create(name: "Pop Rocks", price: 1.50)
    @dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)
    visit machine_path(@dons)

    expect(page).to have_content("White Castle Burger: $3.50")
    expect(page).to have_content("Pop Rocks: $1.50")
    expect(page).to have_content("Flaming Hot Cheetos: $2.50")
  end

  scenario 'they see the average price for all snacks associated with that machine' do
    @dons.snacks.create(name: "White Castle Burger", price: 3.50)
    @dons.snacks.create(name: "Pop Rocks", price: 1.50)
    @dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)
    visit machine_path(@dons)
    expect(page).to have_content("Average Price: $2.50")
  end

end
