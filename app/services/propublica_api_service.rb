class PropublicaApiService
  def get_member_data(state)
    json_response = conn.get("members/house/#{state}/current.json")
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
    member_data = parsed_data[:results]
  end

  private

  def conn
    Faraday.new(
      url: 'https://api.propublica.org/congress/v1/',
      headers: {'x-api-key' => ENV["propublica_api_key"]}
    )
  end
end
