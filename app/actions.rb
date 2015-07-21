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
  session[:id] = nil
  erb :'index'
end

get '/create' do
  if session[:id]
    erb :'create'
  else
    erb :'index'
  end
end

get '/view' do
  if session[:id]
    @track = Track.all
    @vote = Vote.all
    erb :'view'
  else
    erb :'index'
  end
end

get '/error' do
  @track = Track.all #failed to write to db
  erb :'error'
end

post '/authenticate' do
  if User.authenticate(params[:user], params[:password])
    session[:id] = User.getname(params[:user])
    redirect :'view'
  else
    @error = 'error'
    erb :'login'
  end
end

post '/new' do
  @track = Track.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url],
    user_id: session[:id]
  )
  if @track.save
    erb :'success' 
  else
    erb :'error'
  end
end

post '/upvote' do
  @vote = Vote.new(
    track_id: params[:track_id],
    user_id: params[:user_id]
  )
  if @vote.save
    @track = Track.all
    @vote = Vote.all
    erb :'view'
  else
    erb :'error'
  end
end


