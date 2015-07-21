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

post '/authenticate' do
  if User.authenticate(params[:user], params[:password])
    redirect :'view'
  else
    @error = 'ldajdksajd'
    erb :'login'
  end
end

get '/create' do
  erb :'create'
end

get '/view' do
  @track = Track.all
  erb :'view'
end

get '/error' do
  @track = Track.all
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


