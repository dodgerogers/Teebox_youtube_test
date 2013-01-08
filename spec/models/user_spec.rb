require 'spec_helper'

describe User do
  before(:each) do
    @user = FactoryGirl.create(:user)
end

  subject { @user }

  it { should respond_to(:provider)}
  it { should respond_to(:uid)}
  it { should respond_to(:oauth_token)}
  it { should respond_to(:oauth_expires_at)}
  it { should respond_to(:name)}
  it { should respond_to(:email)}
  it { should respond_to(:picture)}
end