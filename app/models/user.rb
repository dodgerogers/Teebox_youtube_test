class User < ActiveRecord::Base
    
  attr_accessible :name, :country, :gender  
  validates_presence_of :name, :email, :provider, :oauth_token
  
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.picture = auth.info.image
      user.gender = auth.info.gender
      user.country = auth.info.locale
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save! 
      end
    end
end
