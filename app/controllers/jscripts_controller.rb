class JscriptsController < ApplicationController

  def vote
    @votes = Photo.find(params[:id])
    @votes.raiting += 1
    @votes.save

    respond_to do |format|
      format.json { render :json => @votes.raiting }
    end
  end
end
