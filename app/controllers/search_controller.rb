class SearchController < ApplicationController
  def index
    @members = SearchFacade.search_members(params[:state])
    @members = search_members(params[:state])
  end

  private

  def search_members(state)
    member_data = get_member_data(state)
    members = create_members(member_data)
    sort_members(members)
  end

  def get_member_data(state)
    propublica_api_service = PropublicaApiService.new(state)
    propublica_api_service.get_members
  end

  def create_members(member_data)
    member_data.map do |member_hash|
      Member.new(member_hash)
    end
  end

  def sort_members(members)
    members.sort_by do |member|
      member.seniority.to_i
    end.reverse
  end


end
