feature 'Paralyze' do

  scenario 'it allows button press' do
    sign_in_and_play
    click_button("Paralyze")
  end
end