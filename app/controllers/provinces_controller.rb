class ProvincesController < ApplicationController

  before_filter :fill_selects, :only => [:new, :create, :edit, :update]

  def index
    @provinces = Province.all
  end
  
  def show
    @province = Province.find(params[:id])
  end
  
  def new
    @province = Province.new
  end
  
  def create
    @province = Province.new(params[:province])
    if @province.save
      flash[:notice] = "Successfully created province."
      redirect_to @province
    else
      render :action => 'new'
    end
  end
  
  def edit
    @province = Province.find(params[:id])
  end
  
  def update
    @province = Province.find(params[:id])
    if @province.update_attributes(params[:province])
      flash[:notice] = "Successfully updated province."
      redirect_to @province
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @province = Province.find(params[:id])
    @province.destroy
    flash[:notice] = "Successfully destroyed province."
    redirect_to provinces_url
  end
  
protected
  def fill_selects
    @countries = Country.find(:all, :order => 'name ASC')
  end
end
