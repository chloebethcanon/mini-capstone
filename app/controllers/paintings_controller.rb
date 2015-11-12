class PaintingsController < ApplicationController

  def home
  end

  def paintings
    @paintings = Painting.all
  end

end
