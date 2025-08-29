class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order({ :year => :desc, :title => :asc })
    render({ :template => "movie_template/index" })
  end

  def show
    path_id = params.fetch("path_id")
    matching_movies = Movie.where({ :id => path_id })
    @movie = matching_movies.first
    director = Director.where({ :id => @movie.director_id }).first
    @director_name = "#{director.first_name} #{director.last_name}"
    render({ :template => "movie_template/show" })
  end
end
