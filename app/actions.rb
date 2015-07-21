# Homepage (Root path)
get '/' do
  erb :'index'
end

get '/signup' do
  erb :'signup'
end

post '/newuser' do
  @user = User.new(
    user: params[:user],
    password: params[:password],
    name: params[:name]
  )
  if @user.save
    redirect :'view'
  else
    erb :'signup'
  end
end

get '/login' do
  erb :'login'
end

get '/logout' do
  session[:name] = nil
  erb :'index'
end

post '/authenticate' do
  if User.authenticate(params[:user], params[:password])
    session[:name] = "Logout" #User.getname(params[:user])
    redirect :'view'
  else
    @error = 'error'
    erb :'login'
  end
end

get '/create' do
  if session[:name]
    erb :'create'
  else
    erb :'index'
  end
end

get '/view' do
  if session[:name]
    @track = Track.all
    erb :'view'
  else
    erb :'index'
  end
end

get '/error' do
  @track = Track.all #failed to write to db
  erb :'error'
end

post '/new' do
  @track = Track.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url]
  )
  if @track.save
    erb :'success' 
  else
    erb :'error'
  end
end


