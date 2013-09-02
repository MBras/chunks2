class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @chunk  = current_user.chunks.build
      @todo_chunks = current_user.todo_chunks
      @recently_closed_chunks = current_user.recently_closed_chunks
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
