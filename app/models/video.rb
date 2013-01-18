class Video < ActiveRecord::Base
  
  attr_accessible :title, :description, :yt_video_id, :is_complete, :user_id, :youtube_url
  belongs_to :user
  
  scope :completes,   where(:is_complete => true)
  scope :incompletes, where(:is_complete => false)
  

  def self.yt_session
    @yt_session ||= YouTubeIt::Client.new(:username => YouTubeITConfig.username , :password => YouTubeITConfig.password , :dev_key => YouTubeITConfig.dev_key)    
  end
  
  def self.yt_oauth
    @yt_ouath ||= YouTubeIt::OAuth2Client.new(client_access_token: self.user.auth_token, client_id: YOUTUBE_KEY, client_secret: YOUTUBE_SECRET, dev_key: DEV_KEY, expires_at: self.user.ouath_expires_at)
  end

  def self.delete_video(video)
      self.destroy
    yt_oauth.video_delete(video.yt_video_id)
    video.destroy
      rescue
        video.destroy
  end

  def self.update_video(video, params)
    yt_session.video_update(video.yt_video_id, video_options(params))
    video.update_attributes(params)
  end

  def self.token_form(params, nexturl)
    yt_session.upload_token(video_options(params), nexturl)
  end

  def self.delete_incomplete_videos
    self.incompletes.map{|r| r.destroy}
  end

  private
    def self.video_options(params)
      opts = {:title => params[:title],
             :description => params[:description],
             :category => "Sports",
             :private => true,
             :keywords => ["Teebox Uploads"]}
      params[:is_unpublished] == "1" ? opts.merge(:private => "true") : opts
    end
end