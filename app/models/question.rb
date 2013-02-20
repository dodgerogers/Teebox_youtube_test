class Question < ActiveRecord::Base
  
  attr_accessible :title, :body, :user_id, :tag_list
  acts_as_taggable 
  belongs_to :user  
  validates_presence_of :title, :body, :user_id
  
  default_scope order('created_at DESC')
  
end
