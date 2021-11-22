class StoragesController < ApplicationController
  before_action :current_fruit, only: [:show, :edit, :update, :destroy]

  def index
    @fruit = Storage.all
  end

  def show 
  end

  def new
    @fruit = Storage.new
  end

  def create
    fruit = Storage.create(fruit_params)

    redirect_to fruit_path(fruit)
  end

  def edit
    if params[:name]
      @fruit.name = params[:name]
      @fruit.qty = params[:qty]
      @fruit.save
      redirect_to root_path
    end
  end

  def update
    @fruit = Storage.find(params[:id])
    if @fruit .update(fruit_params)
      redirect_to root_path
    end

    # redirect_to fruit_path(@fruit)
    
  end

  def destroy
    @fruit.destroy

    redirect_to storages_path
  end

  def search
    @fruit = Storage.where("name LIKE?","%#{params[:search_text]}%").map{|items| items}
    render "index"
  end

  private

  def fruit_params
    params.require(:fruit).permit(:name, :qty)
  end

  def current_fruit
    @fruit = Storage.find(params[:id])
  end

end
