require 'spec_helper'

describe QuestionsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @question = FactoryGirl.attributes_for(:question, user_id: @user)
    controller.stub!(:current_user).and_return(@user)
  end

  describe "GET index" do
    it "renders index template" do
      get :index
      response.should render_template :index
    end
  end
  
  describe "GET new" do
    it "assigns a new question as @question" do
      get :new
      assigns(:question).should be_a_new(Question)
    end
  end
  
  describe "question create" do
    describe "with valid params" do
      it "creates a new question" do
        expect {
          post :create, user_id: @user, question: @question
        }.to change(Question, :count).by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, question: @question
        assigns(:question).should be_a(Question)
        assigns(:question).should be_persisted
      end

      it "redirects to the created question" do
        post :create, question: @question
        response.should redirect_to(Question.last)
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        Question.any_instance.stub(:save).and_return(false)
        post :create, question: @question
        assigns(:question).should be_a_new(Question)
      end

      it "re-renders the 'new' template" do
        Question.any_instance.stub(:save).and_return(false)
        post :create, question: @question
        response.should render_template("new")
      end
    end
  end
  
  describe "PUT update" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @question = FactoryGirl.create(:question, title: "now its hooking", user_id: @user)
    end
    
    it "assigns the requested post as @post" do
      put :update, id: @question, question: FactoryGirl.attributes_for(:question)
      assigns(:question).should eq(@question)
    end
    
    describe "with valid params" do
      it "updates the requested post" do
        put :update, id: @question, question: FactoryGirl.attributes_for(:question, body: "i think the clubace is closed")
        @question.reload
        @question.body.should eq("i think the clubace is closed")
      end

      it "redirects to the post" do
       put :update, id: @question, question: FactoryGirl.attributes_for(:question, title: "its hooking now")
       response.should redirect_to @question
      end
    end
  end
  
  describe "with invalid params" do
    it "does not change @question attributes" do
      put :update, id: @question, 
      question: FactoryGirl.attributes_for(:question, title: "blah", body: nil)
      @question.reload
      @question.title.should_not eq("blah")
    end

    it "re-renders the 'edit' template" do
      put :update, id: @question, question: FactoryGirl.attributes_for(:question)
      response.should render_template :edit
      end
    end
    
    #describe "DELETE destroy" do
    #   before(:each) do
    #     @post = FactoryGirl.create(:post)
    #   end

    #   it "destroys the requested post" do
    #     expect {
    #       delete :destroy, id: @post
    #     }.to change(Post, :count).by(-1)
    #   end

    #   it "redirects to the posts list" do
    #     delete :destroy, id: @post
    #     response.should redirect_to posts_url
    #   end
    # end
end
