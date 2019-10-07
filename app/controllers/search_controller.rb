class SearchController < ApplicationController
  def index
    @members = SearchFacade.new(params[:state]).search_members
  end
end
