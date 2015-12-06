class PaintingsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show, :search] 
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
    @painting = Painting.new
    @suppliers = Supplier.where(active: true)
  end

  def create
    painting = Painting.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      user_id: current_user.id,
      supplier_id: params[:supplier][:supplier_id]
      )
    if painting.save
      flash[:success] = "Listing was successfully created!"
      redirect_to '/paintings'
      # Because of this redirect, you can delete your create.html.erb file.
    else
      # Things went wrong!
      render :new
      # If you redirect, you lose your ruby variable just created.
      # That is why you use render here instead - it keeps what was entered.
    end  
  end

  def edit
    @painting = Painting.find_by(id: params[:id])
    # This is exactly the same as lines 8-9 above!
  end

  def update
    @painting = Painting.find_by(id: params[:id])
    if @painting.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
      )
    flash[:success] = "Listing was successfully updated!"
    redirect_to "/paintings/#{painting.id}"
    else
      render :edit
    end
  end

  def destroy
    painting = Painting.find_by(id: params[:id])
    painting.delete
    flash[:success] = "Listing was successfully deleted!"
    redirect_to '/paintings'
  end

  private

  # think of these as helper methods (under private)

  


end
