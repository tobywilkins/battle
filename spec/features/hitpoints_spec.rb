describe "Checking Hitpoints" do
  it "displays the hitpoints" do
    sign_in_and_play
    expect(page).to have_content("Van #{Player::DEFAULT_HITPOINTS} HP")
  end
end
