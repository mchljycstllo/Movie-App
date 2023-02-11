module Api
  class FrontendController < ApplicationController
    include MovieConcern

    def all_movies
      fetch_all_movies
    end

    def single_movie
      
    end
  end
end