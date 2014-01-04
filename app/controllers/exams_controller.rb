class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :update]

  def index
  	@exams = Exam.paginate(page: params[:page])
  end

  def update
    @lives = session[:lives]
    @answered = @facts[params[:fIndex].to_i]
    if @answered.id == params[:answer].to_i
      #answered correctly
      @resultText = "correct"
    else
      #incorrect answer
      @resultText = "incorrect"
      unless @lives == 0
        @lives = session[:lives] -= 1
      end
    end

    #@currentFact = @facts[@answered.id + 1]
    @currentFact = @facts[params[:fIndex].to_i + 1]

    if @currentFact == @facts.last
      @endOfArray = 'yes'      
    else
      @endOfArray = 'no'
      #@currentFact = @facts[params[:fIndex].to_i + 1]
      #@choices = Fact.where(question_type: @currentFact.question_type).where.not(id: @currentFact.id).order('RANDOM()').limit(3)
      #@choices.push(@currentFact)
      #@choices.shuffle!
    end

    unless @answered == @facts.last
      @choices = Fact.where(question_type: @currentFact.question_type).where.not(id: @currentFact.id).
                order('RANDOM()').limit(3)
      @choices.push(@currentFact)
      @choices.shuffle!
    end


    respond_to do |format|
      format.js
    end
=begin
    @facts = @exam.facts
    @answered = @facts[params[:fIndex].to_i]
    if @answered.id == params[:answer].to_i
      #answered correctly
      @resultText = "Correct!"
    else
      #incorrect answer
      @resultText = "Incorrect :("
    end

    respond_to do |format|
      format.js
    end
=end
  end

  def show
    session[:lives] = 4

    @currentFact = @facts[0]

    @choices = Fact.where(question_type: @currentFact.question_type).where.not(id: @currentFact.id).
                order('RANDOM()').limit(3)
    @choices.push(@currentFact)
    @choices.shuffle!
=begin
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
=end
  end

  def create
  	@exam = current_user.exams.build()
  	@exam.save
  	#flash[:success] = "Exam created."
    redirect_to exam_path(@exam)
  	#redirect_to exams_url
  end

  def destroy
  	Exam.find(params[:id]).destroy
	flash[:success] = "Exam deleted."
	redirect_to exams_url
  end

  def answer_problem

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_exam
    @exam = Exam.find(params[:id])
    @facts = @exam.facts
  end
end