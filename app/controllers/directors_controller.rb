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
end
