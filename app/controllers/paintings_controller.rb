class PaintingsController < ApplicationController

  def home
  end

  def paintings
    @all_paintings = Painting.all
  end

end
