class PropublicaApiService
  def initialize(state)
    @state = state
  end

  def get_members
    json_response = conn.get("members/house/#{@state}/current.json")
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
    parsed_data[:results]
  end

  def conn
    Faraday.new(
      url: 'https://api.propublica.org/congress/v1/',
      headers: {'x-api-key' => ENV["propublica_api_key"]}
    )
  end
end
