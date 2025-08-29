class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render({ :template => "director_templates/index" })
  end

  def show
    path_id = params.fetch("path_id")
    @director = Director.where({ :id => path_id }).first
    @filmography = Movie.where({ :director_id => @director.id })

    render({ :template => "director_templates/show" })
  end

  def youngest
    directors_with_dob = Director.where.not({ :dob => nil })
    sorted_directors = directors_with_dob.order({ :dob => :desc })
    @youngest = sorted_directors.first

    render({ :template => "director_templates/youngest" })
  end
end
