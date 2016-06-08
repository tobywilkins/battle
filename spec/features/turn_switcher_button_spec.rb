describe 'Turn Switcher Button' do
  it 'Ends the current user\'s turn' do
    sign_in_and_play
    click_button("End Turn")
    expect(page).not_to have_content("It is Toby's turn to act...")
    expect(page).to have_content("It is Van's turn to act...")
  end
end