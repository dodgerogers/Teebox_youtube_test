module ApplicationHelper
  
  def html5_video(id)
    
    "<iframe class='youtube-player' type='text/html' width='640' height='385' src='http://www.youtube.com/embed/#{id}' frameborder='0'></iframe>"
  end
end

