class BubblesController < ApplicationController

  def index
    @bubbles = Bubble.all
  end

  def show
    @bubble = Bubble.find(params[:id])
  end

  def map
    render json: Bubble.all.map{ |bubble| bubble.to_map}
  end
end
