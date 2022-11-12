# frozen_string_literal: true

# Controler that manages all actions related to movie creation, room assignment and movie schedule
class MovieController < ApplicationController
  def home; end

  def new
    @movie_times = MovieTime.new
  end

  def post
    title = params[:title]
    image = params[:image]
    adult_film = params[:adult_film]
    idiom = params[:idiom]
    @movie = Movie.new(title:, image:, adult_film:, idiom:)
    if @movie.save
      redirect_to '/movie/new', notice: I18n.t('movie.post')
    else
      redirect_to '/movie/new', notice: @movie.errors.messages
    end
  end

  def create_movie_time
    movie_time_params = params.require(:movie_time).permit(:movie_id, :time, :date_start,
                                                           :date_end, :room, :branch_office)
    movie_time = MovieTime.create(movie_time_params)
    if movie_time.persisted?
      redirect_to '/movie/new', notice: I18n.t('movie.creative_movie_time')
    else
      redirect_to '/movie/new', notice: movie_time.errors.messages
    end
  end

  def list_by_date
    @date   = params[:date]
    @branch = params[:branch_office]
    @adult  = params[:adult_film]
    query = 'movie_times.date_start   <= ? and
             movie_times.date_end     >= ? and
             movie_times.branch_office = ? '
    puts @adult
    if @adult == '0'
      query += 'and movies.adult_film = false'
    end
    @filter = Movie.includes(:movie_times).where([query, @date, @date, @branch]).references(:movie_times)
  end
end
