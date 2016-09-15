# login using class method
get '/login' do
  @user = User.authenticate(params[:username], params[:password])

  if @user
    session[:user_id] = @user.id
    ## happy path
  else
    ## error path
  end
end

# login using instance method
get '/login' do
  @user = User.find_by(username: params[:username])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    ## happy path
  else
    ## error path
  end
end
