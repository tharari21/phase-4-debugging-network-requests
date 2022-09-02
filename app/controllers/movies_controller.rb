class MoviesController < ApplicationController
  def create
    movie = Movie.create(movie_params)
    if movie.persisted?
      render json: movie
    else
      render json: {error: movie.errors.full_messages}
    end
  end
  def index
    movies = Movie.all
    render json: movies
  end
  private
  def movie_params
    params.permit(:title,:year,:length,:director,:description,:poster_url,:category,:discount,:female_director)
  end
end
