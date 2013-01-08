require "spec_helper"

describe CommentsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    @comment = FactoryGirl.attributes_for(:comment, user_id: @user, post_id: @post)
    controller.stub!(:current_user).and_return(@user)
    request.env["HTTP_REFERER"] = "http://test.host/posts"
  end
  
  describe "POST create" do
     describe "with valid params" do
       it "creates a new comment" do
         expect {
           post :create, user_id: @user, comment: @comment
         }.to change(Comment, :count).by(1)
       end

       it "assigns newly created comment as @comment" do
         post :create, comment: @comment
         assigns(:comment).should be_a(Comment)
         assigns(:comment).should be_persisted
       end

       it "redirects back" do
         post :create, comment: @comment
         response.should redirect_to(:back)
       end   
     end
     
     describe "with invalid params" do
       it "assigns newly created but unsaved comment as @comment" do
         Comment.any_instance.stub(:save).and_return(false)
         post :create, comment: @comment
         assigns(:comment).should be_a_new(Comment)
       end
       
       it "re renders the show post template with comment form" do
         Comment.any_instance.stub(:save).and_return(false)
         post :create, comment: @comment
         response.should redirect_to(:back)
       end
     end
   end
   
   describe "DELETE destroy" do
     before(:each) do
       @comment = FactoryGirl.create(:comment)
     end
     
     it "destroys requested comment" do
       expect {
         delete :destroy, id: @comment
       }.to change(Comment, :count).by(-1)
     end
     
     it "redirects back" do
       delete :destroy, id: @comment
       response.should redirect_to(:back)
     end
   end
 end