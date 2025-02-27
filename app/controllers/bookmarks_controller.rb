class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id]) # add new bookmark to specific list by finding the list id
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])        # Find the list we're adding a movie to
    @bookmark = Bookmark.new(bookmark_params)  # Create a new bookmark with the form data
    @bookmark.list = @list                     # Connect this bookmark to the list we found

    if @bookmark.save                          # Save the bookmark
      redirect_to list_path(@list)             # Go to list show page
    else
      render :new, status: :unprocessable_entity  # If validation fails, show the form again
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list), notice: "Movie successfully removed from list"
  end


end
