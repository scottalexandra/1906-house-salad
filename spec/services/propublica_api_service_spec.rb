require 'rails_helper'

describe "Propublica API Service" do
  it "returns member data by state", :vcr do   
    service = PropublicaApiService.new
    state = "CO"
    raw_data = service.get_member_data(state)

    expect(raw_data).to be_a(Array)
    expect(raw_data.first).to have_key(:name)
    expect(raw_data.first).to have_key(:role)
    expect(raw_data.first).to have_key(:party)
    expect(raw_data.first).to have_key(:district)
    expect(raw_data.first).to have_key(:seniority)
  end
end
