require 'spec_helper'

feature 'Firing' do

  scenario 'Firing at a destroyer on A1' do
    visit '/new_game'
    visit '/start_game'
    fill_in 'd_coordinates', with: 'A1'
    fill_in 'd_orientation', with: 'horizontally'
    click_on 'd_submit'
    fill_in 'shot_coordinates', with: 'A3'
    click_on 'Fire'
    expect(page).to have_css('div#A3.ship_hit')
  end  

end
