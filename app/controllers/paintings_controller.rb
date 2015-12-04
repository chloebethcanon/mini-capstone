class PaintingsController < ApplicationController

  def index
    @all_paintings = Painting.all

    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_attribute = params[:search]
    # if params[:sort] == "random"
    #   @all_paintings = []
    #   @all_paintings << Painting.order("RAND()").first
    if params[:sort] == "discount_price" 
      @all_paintings = Painting.where("price <= ?", 100)
    elsif search_attribute   
      @all_paintings = Painting.where("name LIKE ? OR description LIKE ?", "%#{search_attribute}%", "%#{search_attribute}%")
    elsif sort_attribute && sort_order
      @all_paintings = Painting.order(sort_attribute => sort_order)
    end

    if params[:category]
      @all_paintings = Category.find_by(name: params[:category]).paintings
    end
      
  end

  def show
    painting_id = params[:id]
    if params[:id] == "random"
      @painting = Painting.order("RAND()").first
    else  
      @painting = Painting.find_by(id: painting_id)
    end
  end

  def new
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end

  def create
    if current_user && current_user.admin
      painting = Painting.create(
        name: params[:name],
        image: params[:image],
        price: params[:price],
        description: params[:description],
        user_id: current_user.id
        )
      flash[:success] = "Listing was successfully created!"
      redirect_to '/paintings'
      # Because of this redirect, you can delete your create.html.erb file.
    end
  end

  def edit
    if current_user && current_user.admin
      @painting = Painting.find_by(id: params[:id])
      # This is exactly the same as lines 8-9 above!
    end
  end

  def update
    if current_user && current_user.admin
      painting = Painting.find_by(id: params[:id])
      painting.update(
        name: params[:name],
        image: params[:image],
        price: params[:price],
        description: params[:description]
        )
      flash[:success] = "Listing was successfully updated!"
      redirect_to "/paintings/#{painting.id}"
    end
  end

  def destroy
    if current_user && current_user.admin
      painting = Painting.find_by(id: params[:id])
      painting.delete
      flash[:success] = "Listing was successfully deleted!"
      redirect_to '/paintings'
    end
  end


end
