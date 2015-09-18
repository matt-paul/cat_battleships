require 'spec_helper'

feature 'Placing Ships' do

  scenario 'PLacing a destroyer on A1' do
    visit '/new_game'
    visit '/start_game'
    fill_in 'd_coordinates', with: 'A1'
    fill_in 'd_orientation', with: 'horizontally'
    click_on 'd_submit'
    expect(page).to have_css('div.ship')
  end

  scenario 'PLacing another ship on A1 to test false negative global variable when new game is not called' do
    visit '/new_game'
    visit '/start_game'
    fill_in 'b_coordinates', with: 'A1'
    fill_in 'b_orientation', with: 'horizontally'
    click_on 'b_submit'
    expect(page).to have_css('div.ship')
  end

  scenario 'PLacing ship on the board covering F1' do
    visit '/new_game'
    visit '/start_game'
    fill_in 'b_coordinates', with: 'F1'
    fill_in 'b_orientation', with: 'vertically'
    click_on 'b_submit'
    expect(page).to have_css('div.ship#F1')

  end


end

  # scenario 'Placing a ship on cells B1-B3' do
