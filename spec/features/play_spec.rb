require 'spec_helper'

feature 'attack' do
	it 'lowers hit points' do
		sign_in
		click_button 'Attack'
    expect(page).not_to have_content "Elena: 100"
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
    expect(page).to have_content "Elena, it's your turn!"
  end
end

feature 'lose screen' do
  scenario 'player two loses' do
    sign_in
    39.times do
      click_button "Attack" if page.has_content?("turn")
    end
    expect(page).to have_content "loses"
  end
end

feature 'vs AI' do
	it "AI to take its turn" do
		visit '/'
		fill_in :Player, with: 'Kenneth'
		click_button :single_player
		click_button 'Attack'
		expect(page).to have_content "Kenneth, it's your turn!"
	end
end

feature 'multiple attacks available' do
	it 'has a range of attacks to choose from' do
		sign_in
		expect(page).to have_content "Attack"
		expect(page).to have_content "Sleep"
		expect(page).to have_content "Poison"
		expect(page).to have_content "Heal"
	end
end
