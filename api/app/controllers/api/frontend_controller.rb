module Api
  class FrontendController < ApplicationController
    include MovieConcern

    def all_movies
      fetch_all_movies
    end
  end
end