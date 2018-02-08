# Specify gemfile Location and general variables

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

puts ENV['BUNDLE_GEMFILE']

# Perform requiring gem that we need

######################################################################

# basic

require 'rubygems'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

require 'pathname'

require 'pg'

require 'active_record'

require 'sinatra'

APP_ROOT = Pathname.new(File.expand_path('../', __FILE__))

require APP_ROOT.join('config', 'database')

get '/' do

erb :"home"

end

get '/questions/new' do
 erb :"new"
end


post '/submit' do
  @question = Question.new(the_question: params[:the_question])

       if @question.save
  
  	   redirect '/questions/' + @question.id.to_s
       else
	   print "sorry error"
  	   end
end

get '/questions' do
	@questions = Question.all
	erb :"questions/questions"
end

get '/questions/:id' do

  @question = Question.find(params[:id])
  erb :"questions/show"

end

put '/questions/:id' do 
  
  @question = Question.find(params[:id])
  @question.update(the_question: params[:the_question])
  erb :"questions/show"

end

delete '/questions/:id' do 
  
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/questions'
  erb :"questions/show"

end
 