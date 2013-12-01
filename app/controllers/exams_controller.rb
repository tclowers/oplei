class ExamsController < ApplicationController

  def index
  	@exams = Exam.paginate(page: params[:page])
  end

  def create
  end

  def destroy
  end
end