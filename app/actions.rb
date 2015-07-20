# Homepage (Root path)
get '/' do
  erb :'index'
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
