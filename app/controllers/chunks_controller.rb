class ChunksController < ApplicationController
  before_action :signed_in_user
  
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

  private

    def chunk_params
      params.require(:chunk).permit(:description)
    end
end
