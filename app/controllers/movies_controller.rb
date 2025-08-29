class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render({ :template => "movie_template/index"})
  end
end
