require 'rails_helper'

describe "user can search for house members" do
  scenario "by state" do
    json_response = File.open('./fixtures/propublica_member_data.json')
    stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json")
    .to_return(status: 200, body: json_response)

    visit '/'
    select "Colorado", from: :state
    click_on 'Locate Members from the House'

    expect(current_path).to eq(search_path)
    expect(page).to have_content("7 Results")
    within(".members") do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
      expect(page).to have_css(".seniority")
    end
  end
end
