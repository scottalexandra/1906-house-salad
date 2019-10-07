class SearchController < ApplicationController
  def index
    @members = search_members(params[:state])
  end

  private

  def search_members(state)

    member_data = get_member_data(state)
    #grab data from API
    # propublica_api_service = PropublicaApiService.new(state)
    # member_data = propublica_api_service.get_members


    #format data by changing it into an object
    members = create_members(member_data)

    # members = member_data.map do |member_hash|
    #   Member.new(member_hash)
    # end

    #format data by sorting it
    sort_members(members)

    # members.sort_by do |member|
    #   member.seniority.to_i
    # end.reverse
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
