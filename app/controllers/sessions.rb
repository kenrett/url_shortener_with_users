get '/user/view/:id' do
  @user = User.find(params[:id])
  erb :my_profile
end
