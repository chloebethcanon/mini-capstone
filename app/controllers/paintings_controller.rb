class PaintingsController < ApplicationController

  def home
  
  end

  def index
    @all_paintings = Painting.all
  end

  def eachpainting
    @each_painting = Painting.last
  end

  def purchase
  end

end
