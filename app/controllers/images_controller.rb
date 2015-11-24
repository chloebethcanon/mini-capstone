class ImagesController < ApplicationController

  def image
    image = Image.find_by(id: painting_id)
  end

end
