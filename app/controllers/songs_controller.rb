class SongsController < ApplicationController
  before_action :set_artist

  def index
  end

  def new
    @charts = Chart.all - @artist.charts
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to artist_songs_path(@artist)
    else
      render :new
    end
  end

  def destroy
    @song = @artist.songs.find(params[:id])
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end

  private 
    def song_params
      params.require(:song).permit(:title, :album, :genre, :chart_id)
    end

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end
end
