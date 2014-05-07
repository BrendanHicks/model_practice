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

    number_of_movies = {}

    Director.all.each do |the_director|

      number_of_movies[the_director.name] = the_director.movies.count
    end

    sorted_hash_of_directors = number_of_movies.sort_by {|name, number| number}.reverse

    @director_with_the_most_movies = sorted_hash_of_directors.first[0]
  end

  def question_4
    # Which actor has been in the most movies on the list?

    # Your Ruby goes here.

    # @actor_with_the_most_movies = ???
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
