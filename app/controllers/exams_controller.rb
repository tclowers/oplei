class ExamsController < ApplicationController

  def index
  	@exams = Exam.paginate(page: params[:page])
  end

  def show
	@exam = Exam.find(params[:id])
	@facts = @exam.facts
  end

  def create
	@exam = current_user.exams.build()
	@exam.save
	flash[:success] = "Exam created."
	redirect_to exams_url
  end

  def destroy
  	Exam.find(params[:id]).destroy
	flash[:success] = "Exam deleted."
	redirect_to exams_url
  end
end