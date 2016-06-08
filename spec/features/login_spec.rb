require 'spec_helper'

feature 'players login' do
	it 'lets players login' do
		visit '/'
		fill_in :Player1, with: 'Kenneth'
		fill_in :Player2, with: 'Elena'
		click_button :Submit
		expect(page).to have_content 'Kenneth vs. Elena'
	end

end

feature 'single player' do
	it 'starts a single player game' do
		visit '/'
		fill_in :Player, with: 'Kenneth'
		click_button :single_player
		expect(page).to have_content 'Kenneth vs. Capybara'
	end

end
