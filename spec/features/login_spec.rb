require 'spec_helper'

describe 'players login' do
	it 'lets players login' do
		visit '/'
		fill_in :Player1, with: 'Kenneth'
		fill_in :Player2, with: 'Elena'
		click_button :Submit
		expect(page).to have_content 'Kenneth vs. Elena'
	end
end

describe 'battle screen' do
	before(:each) do
		visit '/'
		fill_in :Player1, with: 'Kenneth'
		fill_in :Player2, with: 'Elena'
		click_button :Submit
	end


	it 'health of players is displayed' do
		expect(page).to have_content 'Kenneth 100'
		expect(page).to have_content 'Elena 100'
	end
end
