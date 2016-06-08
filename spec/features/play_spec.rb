require 'spec_helper'

feature 'attack' do
	it 'lowers hit points by 10' do
		visit '/'
		fill_in :Player1, with: 'Kenneth'
		fill_in :Player2, with: 'Elena'
		click_button :Submit
		click_button 'Attack Player 2'
    expect(page).to have_content "Elena: 90"
	end
end

feature 'battle screen' do
	before(:each) do
		visit '/'
		fill_in :Player1, with: 'Kenneth'
		fill_in :Player2, with: 'Elena'
		click_button :Submit
	end

	it 'can see the health of players' do
		expect(page).to have_content 'Kenneth: 100'
		expect(page).to have_content 'Elena: 100'
	end

	it 'can attack player 2' do
		click_button "Attack Player 2"
		expect(page).to have_content 'Elena got attacked'
	end

end
