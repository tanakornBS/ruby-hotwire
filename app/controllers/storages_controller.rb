class StoragesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @fruit = Storage.all
  end

  def show
    @fruit = Storage.find(params[:id])
  end

  def new
    @fruit = Storage.new
  end

  def create
    @fruit = Storage.new(storage_params)
    @fruit.user = current_user
    if @fruit.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @fruit = Storage.find(params[:id])
  end

  def update
    @fruit = Storage.find(params[:id])

    if @fruit.update(storage_params)
      format.turbo_stream
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fruit = Storage.find(params[:id])
    @fruit.destroy

    redirect_to root_path
  end

  private
    def storage_params
      params.require(:storage).permit(:name, :qty, :main_image)
    end

end
