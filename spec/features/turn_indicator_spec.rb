describe 'Turn Indicator' do
before do sign_in_and_play end
  it 'displays the current active players turn' do
    expect(page).to have_content("It is Toby's turn to act...")
  end

  it 'switches turn to the other player' do
  click_button("Attack")
  expect(page).to have_content("It is Van's turn to act...")
  end
end