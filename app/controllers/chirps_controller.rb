class ChirpsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @chirps = Chirp.all
  end

  def show
    @chirp = Chirp.find(params[:id])
    @comment = Comment.new
  end

  def new
    @chirp = Chirp.new
  end

  def create
    @chirp = Chirp.new(
                      content: params[:content],
                      user_id: current_user.id
                      )
    if @chirp.save
      flash[:success] = "Chirp successfully created!"
      redirect_to "/chirps"
    else
      render 'new'
    end
  end

  def edit
    @chirp = Chirp.find(params[:id])
  end

  def update
    @chirp = Chirp.find(params[:id]) 

    if @chirp.update(content: params[:content])
      flash[:success] = "Chirp was updated!"
      redirect_to "/chirps/#{@chirp.id}"
    else
      render 'edit'
    end
  end

  def destroy
    chirp = Chirp.find(params[:id])
    chirp.destroy
    flash[:success] = "Chirp was deleted."
    redirect_to "/chirps"
  end
end
