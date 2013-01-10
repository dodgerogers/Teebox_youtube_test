class User < ActiveRecord::Base
  
  attr_accessible :age, :gender, :country, :picture, :name
  
  validates_presence_of :name, :email, :provider, :oauth_token
  
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.picture = auth.info.image
      user.save!
      redirect_to edit_user_path(self) if user.new_record? end
    end
end
