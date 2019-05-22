class SearchController < ApplicationController
  def index
    locals: {
      facade: SearchFacade.new
    }
  end
end
