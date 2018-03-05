get '/' do

 @name = nil || cookies[:name]
 erb :'home'

end

post "/" do

 cookies[:name] = params["name"]

 redirect "/"

end


get '/questions/new' do
 erb :"new"
end


post '/submit' do
  @question = Question.new(the_question: params[:the_question])
    
       @question.user_id = cookies[:user_id]

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
 