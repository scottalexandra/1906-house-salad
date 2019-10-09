class SearchController < ApplicationController
  def index
    @members = search_members(params[:state])
  end

  private

  def search_members(state)
    #grab relevant data from external api
    service = PropublicaApiService.new
    member_data = service.get_member_data(state)

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
