class PaintingsController < ApplicationController

  def home
  end

  def allpaintings
    @all_paintings = Painting.all
  end

  def eachpainting
    @each_painting = Painting.last
  end

end
