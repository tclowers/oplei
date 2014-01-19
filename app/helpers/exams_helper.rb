module ExamsHelper
	def answer_size(answer)
		case answer.length
		when 0..30
			'small-answer'
		when 31..48
			'med-answer'
		else # answer.length > 48
			'big-answer'
		end
	end
=begin
 ## previously in view:
 <% if choice.answer.length <= 30 %>
 	<% answer_size = 'small-answer' %>
 <% elsif choice.answer.length > 30 && choice.answer.length <= 48 %>
 	<% answer_size = 'med-answer' %>
 <% elsif choice.answer.length > 48 %>
 	<% answer_size = 'big-answer' %>
 <% end %>
=end
end
