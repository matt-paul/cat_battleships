require 'spec_helper'

feature 'Ship Sinking' do

  scenario 'Firing at a destroyer on A1 sinks the ship' do
    visit '/new_game'
    visit '/start_game'
    fill_in 'd_coordinates', with: 'A1'
    fill_in 'd_orientation', with: 'horizontally'
    click_on 'd_submit'
    fill_in 'shot_coordinates', with: 'A1'
    click_on 'Fire'
    fill_in 'shot_coordinates', with: 'A2'
    click_on 'Fire'
    fill_in 'shot_coordinates', with: 'A3'
    click_on 'Fire'
    expect(page).to have_css('div.sunk')
  end

end
