get '/sign_up' do

	erb :"users/signup"

end

post '/sign_up' do
	p params
	p params[:email]
	p params[:password]
	p params[:name]
	users = User.new(name: params[:name], email: params[:email], password: params[:password])
	weirdnumber = [(0...8).map { (65 + rand(26)).chr }.join]
    
    users.cookiestring = weirdnumber
    cookies[:rand_string] = weirdnumber

    if users.cookiestring[2..9] == cookies[:rand_string]
       cookies[:rand_string]
    else
       "nope"	
    end
	# users.cookiestring = "hello"
	# cookies[:rand_string] = "hello"


	# 1) database (cookiestring column in user table ) = a 
	# 2) cookies[:rand_string = a 



	# 1) assign value to 2 things 
	# 2) match values of 2 things 

	# users.cookistring == cookies[:rand_string]

       # @question.user_id = cookies[:user_id]

	# cookies[:rand]
	users.save
    
	redirect to '/index'

end 


get '/index' do 

 @users = User.all

 @user = User.find(1)
 p @user

 erb :"users/index"

end 

get '/sign_in' do
	p params
	p params[:email]
	p params[:password]

    

    erb :"users/signin"
end 


post '/sign_in' do


	user = User.find_by(email: params[:email]) 
	user.password == params[:password]
	
    if params[:password] = user.password
    	cookies[:user_id] = user.id
        cookies[:rand_string] = user.cookiestring[2..9]

    else
    	"wrong password"
    end

    redirect to '/questions'
end


post '/logout' do 
	cookies[:user_id] = nil
	cookies[:rand_string] = nil
end 
