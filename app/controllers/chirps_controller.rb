class ChirpsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @chirps = Chirp.all
  end

  def show
    @chirp = Chirp.find(params[:id])
  end

  def new
    
  end

  def create
    chirp = Chirp.new(content: params[:content])
    chirp.save
    flash[:success] = "Chirp successfully created!"
    redirect_to "/chirps"
  end

  def edit
    @chirp = Chirp.find(params[:id])
  end

  def update
    chirp = Chirp.find(params[:id])
    chirp.update(content: params[:content])
    flash[:success] = "Chirp was updated!"
    redirect_to "/chirps/#{chirp.id}"
  end

  def destroy
    chirp = Chirp.find(params[:id])
    chirp.destroy
    flash[:success] = "Chirp was deleted."
    redirect_to "/chirps"
  end
end
