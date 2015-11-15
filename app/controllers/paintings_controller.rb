class PaintingsController < ApplicationController

  def home
  
  end

  def index
    @all_paintings = Painting.all
  end

  def new
  end

  def create
    @painting = Painting.create(
      name: params[:input_name],
      image: params[:input_image],
      price: params[:input_price],
      description: params[:input_description]
      )
  end

  def show
    painting_id = params[:id]
    @painting = Painting.find_by(id: painting_id)
  end

  def purchase
  end

end
