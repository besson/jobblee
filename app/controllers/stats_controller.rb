class BubblesController < ApplicationController

  def index
    @bubbles = Bubble.all
  end

end

