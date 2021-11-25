class StoragesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :current_fruit, only: [:show, :edit, :update, :destroy]

  def index
    @fruit = Storage.all
  end

 

  def new
    @fruit = Storage.new
  end

  def create
    @fruit = Storage.new(storage_params)
    @fruit.user = current_user
    if @fruit.save
      redirect_to root_path
    end

  end

  def edit
    if storage_params.present?
      @fruit.update(storage_params)
        redirect_to root_path
    end
    p "------------------"
    p current_fruit
  end

  def update
    @fruit = Storage.find(params[:id])
    p params[:id]
    p storage_params
    if @fruit.update(params[:name, :qty, :main_image])
      
      redirect_to root_path
    end
    redirect_to root_path
    
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

  def storage_params
    params.permit(:name, :qty, :main_image)  
  end

  def current_fruit
    p "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    @fruit = Storage.find(params[:id])
    p @fruit
  end

end
