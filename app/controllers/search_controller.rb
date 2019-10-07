class SearchController < ApplicationController
  def index
    @members = search_members(params[:state])
  end

  private

  # def conn
  #   Faraday.new(
  #     url: 'https://api.propublica.org/congress/v1/',
  #     headers: {'x-api-key' => ENV["propublica_api_key"]}
  #   )
  # end

  def search_members(state)
    propublica_api_service = PropublicaApiService.new(state)
    member_data = propublica_api_service.get_members

    #grab relevant data from external api
    # json_response = conn.get("members/house/#{state}/current.json")
    # parsed_data = JSON.parse(json_response.body, symbolize_names: true)
    # member_data = parsed_data[:results]








    #format data by changing it into an object
    members = member_data.map do |member_hash|
      Member.new(member_hash)
    end

    #format data by sorting it
    members.sort_by do |member|
      member.seniority.to_i
    end.reverse
  end
end
