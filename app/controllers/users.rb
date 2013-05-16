post '/user/login' do
  @user = User.authenticate(params[:username], params[:password])

  if @user
    session[:user_id]= @user.id
    redirect "/user/view/#{current_user.id}"
  else
    #@errors = User.errors.full_messages
    'Nope!'
    erb :index
  end
end

get '/user/logout' do
 session.destroy
 redirect '/'
end

post '/user/create_account' do
  @user = User.new(params)
    @user.save
  if @save
    session[:user_id] = user_id
    redirect "/user/view/#{current_user.id}"
  else
    @errors = @user.errors
    erb :index
  end
end
