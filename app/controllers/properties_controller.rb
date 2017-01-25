class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]
  def index
    @properties = Property.all
  end
  def show
  end
  def set_property
    @property = Property.find(params[:id])
  end

end

