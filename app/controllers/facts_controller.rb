class FactsController < ApplicationController
	before_action :check_for_cancel, :only => [:create]

	def index
		@facts = Fact.paginate(page: params[:page])
	end

	def show
		@fact = Fact.find(params[:id])
	end

	def new
		@fact = Fact.new
	end

	def create
		@fact = Fact.new(fact_params)
		if @fact.save
			flash[:success] = "Fact added"
			redirect_to facts_path
		else
			render 'new'
		end
	end

	private

		def fact_params
			params.require(:fact).permit(:question, :answer, :question_type)
		end

		def check_for_cancel
		  if params[:commit] == "Cancel"
		    redirect_to facts_path
		  end
		end

end
