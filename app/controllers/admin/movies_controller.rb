class Admin::MoviesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
  end  
  #layout "inadmin"
  layout "admin_20141208"
  def index
    @movies = Movie.all_active
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new(:published => true)
  end

  def create
    @movie = Movie.new(params[:movie])
    @movie.active = true
    if @movie.save
      redirect_to [:admin, @movie], :notice => "Successfully created movie."
    else
      render :action => 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(params[:movie])
      redirect_to [:admin, @movie], :notice  => "Successfully updated movie."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.newdestroy
    redirect_to admin_movies_url, :notice => "Successfully destroyed movie."
  end
end
