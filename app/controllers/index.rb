get '/' do
  redirect '/posts'
end

get '/posts' do
  @posts = Post.all
  erb :index
end

get '/post/:id/vote' do
  post = Post.find(params[:id])
  post.votes.create(value: 1)
  redirect "/posts"
end

delete '/post/:id' do
  post = Post.find(params[:id])
  post.destroy
  redirect "/posts"
end

post '/posts' do
  Post.create(params)
  redirect '/posts'
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end