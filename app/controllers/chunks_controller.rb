class ChunksController < ApplicationController
  before_action :signed_in_user
  # XXX not uitgezet omdat eerst de test goed moet zijn
  #before_action :correct_user, only: [:event]
  
  def create
  	@chunk = current_user.chunks.build(chunk_params)

    # needs fixing for other start statusses
    @chunk.status_id = 0

    if @chunk.save
      flash[:success] = "Chunk created!"
      redirect_to root_url
    else
      @todo_chunks = []
      @recently_closed_chunks = []
      render 'static_pages/home'
    end
  end

  def event
    # update the status of the chunk  
    flash[:success] = "Perform event " + params['event_id'] + " on chunk " + params['id']
    redirect_to root_url
  end

  private

    def chunk_params
      params.require(:chunk).permit(:description)
    end

    def correct_user
      @chunk = current_user.chunks.find_by(id: params[:id])
      if @chunk.nil?
        flash[:warning] = "Wrong user"
        redirect_to root_url
      end
    end

end
