class PaintingsController < ApplicationController

  def index
    @all_paintings = Painting.all
  end

  def show
    painting_id = params[:id]
    @painting = Painting.find_by(id: painting_id)
  end

  def new
  end

  def create
    painting = Painting.create(
      name: params[:name],
      image: params[:image],
      price: params[:price],
      description: params[:description]
      )
    redirect_to '/paintings'
    # Because of this redirect, you can delete your create.html.erb file.
  end

  def edit
    @painting = Painting.find_by(id: params[:id])
    # This is exactly the same as lines 8-9 above!
  end

  def update
    painting = Painting.find_by(id: params[:id])
    painting.update(
      name: params[:name],
      image: params[:image],
      price: params[:price],
      description: params[:description]
      )
    redirect_to "/paintings/#{painting.id}"
  end

  def destroy
    painting = Painting.find_by(id: params[:id])
    painting.delete
    redirect_to '/paintings'
  end


end
