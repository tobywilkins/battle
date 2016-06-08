describe "Make attack" do

  it "presses a button to attack" do
    sign_in_and_play
    click_button("Attack")
  end

  it "shows a message confirming attack" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("You successfully attacked Van doing")
  end

end
