require 'spec_helper'

describe Question do
  before(:each) do
    @question = FactoryGirl.create(:question)
  end
  
  subject { @question }

  it { should respond_to(:title)}
  it { should respond_to(:body)}
  it { should respond_to(:user_id)}
  it { should respond_to(:created_at)}

end