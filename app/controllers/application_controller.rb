
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts'do
  post = Post.create
  post.name = params[:blog][:name]
  post.content = params[:blog][:post]
  post.save

  erb :index
  end

  get '/posts' do
  @posts = Post.all
  erb :index
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
      @post.delete
      erb :delete
  end

  patch '/posts/:id' do
    # binding.pry
    @post = Post.find(params[:id])
    @post.name = params[:blog][:name]
    @post.content = params[:blog][:post]
    @post.save
    erb :show
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
      erb :show
  end


end
