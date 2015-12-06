class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.create(params[:supplier])
    redirect_to "/suppliers/#{@supplier.id}"
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
