class ExamsController < ApplicationController

  def index
  	@exams = Exam.paginate(page: params[:page])
  end

  def show
  	@exam = Exam.find(params[:id])
  	@facts = @exam.facts
    if params[:fIndex]
      @answered = @facts[params[:fIndex].to_i]
      if @answered.id == params[:answer].to_i
        #answered correctly
        @resultText = "Correct!"
      else
        #incorrect answer
        @resultText = "Incorrect :("
      end

      #@currentFact = @facts[@answered.id + 1]
      @currentFact = @facts[params[:fIndex].to_i + 1]

      if @currentFact == @facts.last
        @endOfArray = 'yes'      
      else
        @endOfArray = 'no'
      end

    else
      ## first question ##
      @currentFact = @facts[0]
    end

    unless @answered == @facts.last
      @choices = Fact.where(question_type: @currentFact.question_type).where.not(id: @currentFact.id).
                  order('RANDOM()').limit(3)
      @choices.push(@currentFact)
      @choices.shuffle!
    end
    
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