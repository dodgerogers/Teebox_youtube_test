class QuestionsController < ApplicationController

  def index
    @questions = Question.all
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
      redirect_to @question 
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