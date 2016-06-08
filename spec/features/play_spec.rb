require 'spec_helper'

feature 'attack' do
	it 'lowers hit points by 10' do
		sign_in
		click_button 'Attack'
    expect(page).to have_content "Elena: 90"
	end
end

feature 'battle screen' do
	before(:each) do
		sign_in
	end

	it 'can see the health of players' do
		expect(page).to have_content 'Kenneth: 100'
		expect(page).to have_content 'Elena: 100'
	end

	it 'can attack player 2' do
		click_button "Attack"
		expect(page).to have_content 'Elena got attacked'
	end

end

feature 'turn switching' do
  it 'swaps turn to player 2' do
    sign_in
    click_button "Attack"
    expect(page).to have_content "Elena's turn"
  end
end
