class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings

    @ratings = params[:ratings] || session[:ratings]
    @sort = params[:sort] || session[:sort]
  
    unless @ratings
      @ratings = Hash[@all_ratings.map {|rating| [rating, 1]}]
    end
    
    if params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
      session[:sort] = @sort
      session[:ratings] = @ratings
      redirect_to :sort => @sort, :ratings => @ratings and return
    end

    if @ratings and @sort
      @movies = Movie.order(@sort).find_all_by_rating(@ratings.keys)
    elsif @sort 
      @movies = Movie.order(@sort)
    elsif @ratings
      @movies = Movie.find_all_by_rating(@ratings.keys)      
    else 
      @movies = Movie.all
    end    

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
