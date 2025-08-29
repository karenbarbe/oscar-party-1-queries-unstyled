class ActorsController < ApplicationController
  def index
    @actors = Actor.all

    render({ :template => "actor_templates/index" })
  end

  def show
    path_id = params.fetch("path_id")
    @actor = Actor.where({ :id => path_id }).first
    @matching_credits = Credit.where({ :actor_id => @actor.id })
    render({ :template => "actor_templates/show" })
  end
end
