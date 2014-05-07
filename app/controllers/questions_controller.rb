class QuestionsController < ApplicationController
  def question_1
    # What is the most recent movie on the list that the second actor appeared in?

    # Your Ruby goes here.

    the_actor = Actor.second
    the_list_of_movies = the_actor.movies.order("year DESC")


    @most_recent_movie_for_second_actor = the_list_of_movies.first.title
  end

  def question_2
    # Who directed the longest movie on the list?

    # Your Ruby goes here.

    longest_movie = Movie.order("duration DESC").first

    @director_of_longest_movie = longest_movie.director.name
    @number_of_minutes = longest_movie.duration
  end

  def question_3
    # Which director has the most movies on the list?

    # Your Ruby goes here.

    number_of_movies_array = Array.new

    Director.all.each do |the_director|

      number_of_movies_array << {"name" => the_director.name, "movie_count" => the_director.movies.count}

    end

    sorted_hash_of_directors = number_of_movies_array.sort_by {|movies| movies["movie_count"]}.reverse


    @director_with_the_most_movies = sorted_hash_of_directors.first["name"]

  end

  def question_4
    # Which actor has been in the most movies on the list?

    # Your Ruby goes here.

    movies_array = Array.new

    Actor.all.each do |actor|

      movies_array << { :count => actor.movies.count, :actor_name => actor.name}

    end

    sort_movies_array = movies_array.sort_by {|a| a[:count]}.reverse
    most_movies_on_list = sort_movies_array.first[:count]
    actors_with_most_movies_array = movies_array.select  {|a| a[:count] == most_movies_on_list}

    final_list_of_actors =[]

    actors_with_most_movies_array.each do |actor|

      final_list_of_actors << actor[:name]

    end

    @actor_with_the_most_movies = final_list_of_actors



  end

  def question_5
    # This one is hard. Work on it after all your other review is complete.

    # Which actor/director pair has the most movies on the list?

    # Your Ruby goes here.

    # @actor = ???
    # @director = ???
    # @movies_together = ???
  end
end
