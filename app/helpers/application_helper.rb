module ApplicationHelper
  
  def html5_video(id)
    "<iframe class='youtube-player' type='text/html' width='640' height='385' src='http://www.youtube.com/embed/#{id}' frameborder='0'></iframe>"
  end
  
  def youtube_url_html5(url)
    "<iframe class='youtube-player' type='text/html' width='640' height='385' src='http://www.youtube.com/embed/#{strip_url(url)}' frameborder='0'></iframe>"
  end
  
  def strip_url(url)
    url.gsub!("http://www.youtube.com/watch?v=", "")
  end
  
  def question_tags(question)
     raw question.tag_list.map { |t| link_to t, tag_path(t) }.join(', ') 
  end
  
  def get_question_tags
    tags = []
    Question.all.each { |q| q.tag_list.each {|t| tags << t } }
      tags
  end
end

