describe "Make attack" do
  it "presses a button to attack" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Van's hitpoints: 50")
  end
end
