class FactsController < ApplicationController

	def index
		@facts = Fact.all
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
			params.require(:fact).permit(:question, :answer)
		end
end
