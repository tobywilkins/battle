def sign_in
  visit '/'
  fill_in :Player1, with: 'Kenneth'
  fill_in :Player2, with: 'Elena'
  click_button :Submit
end
