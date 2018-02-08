class Question < ActiveRecord::Base
	validates :the_question, presence: true
end
