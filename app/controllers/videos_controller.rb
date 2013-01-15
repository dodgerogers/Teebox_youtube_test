class VideosController < ApplicationController
  before_filter :get_videos, only: [:show, :edit, :update, :destroy]
  
  def get_videos
    @video = Video.find(params[:id])
  end
  
  def new
    @video = Video.new
  end
  
  def index
    @videos = Video.all
  end
  
  def show
  end
  
  def upload
    @video = Video.create(params[:video])
    if @video
      @upload_info = Video.token_form(params[:video], save_video_new_video_url(:video_id => @video.id))
    else
      respond_to do |format|
        format.html { render "new" }
      end
    end
  end
  
  def edit
  end

  def update
    @result    = Video.update_video(@video, params[:video])
    respond_to do |format|
      format.html do
        if @result
          redirect_to @video, :notice => "video successfully updated"
        else
          respond_to do |format|
            format.html { render "/videos/_edit" }
          end
        end
      end
    end
  end

  def save_video
    @video = Video.find(params[:video_id])
    if params[:status].to_i == 200
      @video.update_attributes(:yt_video_id => params[:id].to_s, :is_complete => true)
      Video.delete_incomplete_videos
    else
      Video.delete_video(@video)
    end
    redirect_to videos_path, :notice => "video successfully uploaded"
  end

  def destroy
    if Video.delete_video(@video)
      flash[:notice] = "video successfully deleted"
    else
      flash[:error] = "video unsuccessfully deleted"
    end
    redirect_to videos_path
  end

  
  protected
    def collection
      @videos ||= end_of_association_chain.completes
    end

end