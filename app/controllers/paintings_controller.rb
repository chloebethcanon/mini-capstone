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
      name: params[:name],
      image: params[:image],
      price: params[:price],
      description: params[:description]
      )
  end

  def show
    painting_id = params[:id]
    @painting = Painting.find_by(id: painting_id)
  end

  def purchase
  end

end
