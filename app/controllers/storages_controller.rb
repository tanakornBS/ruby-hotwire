class StoragesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
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
    @fruit = Storage.new(storage_params)
    @fruit.user = current_user
    if @fruit.save
      redirect_to root_path
    end

  end

  def edit
    @fruit = Storage.find(params[:id])
  end

  def update
    if @fruit.update(storage_params)
      p "--------------------------------------"
      p storage_params
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
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
    @fruit = Storage.find(params[:id])
  end

end
