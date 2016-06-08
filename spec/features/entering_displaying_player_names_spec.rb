describe 'Entering displaying player names' do
  it 'allow players to submit names, submit form, view names' do
    sign_in_and_play
    expect(page).to have_content('Toby vs Van!')
  end
end
