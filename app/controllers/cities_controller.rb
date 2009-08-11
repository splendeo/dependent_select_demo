class CitiesController < ApplicationController

  require 'ostruct'

  before_filter :fill_selects, :only => [:index, :new, :create, :edit, :update]

  def index
    @query=OpenStruct.new(params[:query])
    
    if !params[:query] or !@query.province_id
      @cities = []
      flash[:notice] = "Please enter country and province"
    else
    
      @cities = City.find :all,
        :include => {:province=>:country}, 
        :conditions => {:province_id => @query.province_id},
        :order => 'countries.name ASC, provinces.name ASC, cities.name ASC'
    end
  end
  
  def show
    @city = City.find(params[:id])
  end
  
  def new
    @city = City.new
  end
  
  def create
    @city = City.new(params[:city])
    if @city.save
      flash[:notice] = "Successfully created city."
      redirect_to @city
    else
      render :action => 'new'
    end
  end
  
  def edit
    @city = City.find(params[:id])
  end
  
  def update
    @city = City.find(params[:id])
    if @city.update_attributes(params[:city])
      flash[:notice] = "Successfully updated city."
      redirect_to @city
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @city = City.find(params[:id])
    @city.destroy
    flash[:notice] = "Successfully destroyed city."
    redirect_to cities_url
  end
  
  def fill_selects
    @countries = Country.find(:all, :order => 'name ASC')
    @provinces = Province.find(:all, :order => 'name ASC')
  end
end
