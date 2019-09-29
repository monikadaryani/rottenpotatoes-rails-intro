class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
    
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
    
  end

  def index
    
    if !params[:sort_by].nil?
      session[:sort_by] = params[:sort_by]
    end
    if !params[:ratings].nil?
      session[:ratings] = params[:ratings]
    end
    
    column_name = session[:sort_by]
    @all_ratings=Movie.uniq.pluck(:rating)
    @selected_keys||=@all_ratings
    @selected_rating = session[:ratings]
    if(@selected_rating)
      @selected_keys = @selected_rating.keys
    end
     
    @movies = Movie.where(rating: @selected_keys).order(column_name)
    
  end

  def new
    # default: render 'new' template
    
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
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
