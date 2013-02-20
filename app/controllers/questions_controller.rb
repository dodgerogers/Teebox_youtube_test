class QuestionsController < ApplicationController

  caches_page :index
  
  def index
    if params[:tag]
      @questions = Question.tagged_with(params[:tag]).includes(:user)
    else  
      @questions = Question.all
    end
  end

  def new
    @question = Question.new
  end
  
  def show
    @question ||= Question.find(params[:id])
  end
  
  def create
    @question = current_user.questions.build(params[:question])
    if @question.save 
      redirect_to @question, notice: "Question posted!" 
    else 
      render :new
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update 
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: "Successfully updated" }
        format.json { head :no_content }
      else
        format.html { render "edit", notice: "Plese try again" }
        format.json { render json: @question.errors, status: :unprocessable_entity  }
      end
    end
  end
end