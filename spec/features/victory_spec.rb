describe 'winning the game' do
  it 'shows a page congratulating the win!' do
    sign_in_and_play
    visit '/win'
    expect(page).to have_content("Congratulations! Toby has won the game!")
  end
end