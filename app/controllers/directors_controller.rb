class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id})

    @the_director = matching_records.at(0)
    
    render({ :template => "director_templates/details"})
  end

  def junior
    # @latest_dob = Director.maximum(:dob)

    # @the_youngest_name = Director.find_by(dob: @latest_dob).name

    # @the_youngest_id = Director.find_by(dob: @latest_dob).id
    
    youngest_director = Director.find_by(dob: Director.maximum(:dob))

    @the_youngest_name = youngest_director.name
    @the_youngest_id = youngest_director.id
    @latest_dob = youngest_director.dob

    render({ :template => "director_templates/youngest"})
  end

  def senior
    eldest_director = Director.find_by(dob: Director.minimum(:dob))

    @the_eldest_name = eldest_director.name
    @the_eldest_id = eldest_director.id
    @earliest_dob = eldest_director.dob

    render({ :template => "director_templates/eldest"})
  end
end
