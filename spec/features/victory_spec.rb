describe 'winning the game' do
  it 'shows a page congratulating the win!' do
    sign_in_and_play
    6.times do click_button("Attack") end
    expect(page).to have_content("Congratulations! Toby has won the game!")
  end
end