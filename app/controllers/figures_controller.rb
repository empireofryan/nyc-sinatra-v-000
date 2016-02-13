class FiguresController < ApplicationController
  # get '/figures' do
  #   @figures = Figure.all
  #   erb :'/figures/index'
  # end

  get '/figures' do
    'hello world'
  end

  get '/figures/new' do  
    erb :'/figures/new'
  end

  get '/figures/:slug' do 
    @figure = Figure.find_by_slug(params[:slug])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure_name])
    @figure.title = Title.find_or_create_by(name: params[:title_name])
    @figure.landmark = Landmark.find_or_create_by(name: params[:landmark_name])
    @figure.save
    erb :'figures/show', locals: {message: "Successfully created Figure."}
  end

  get '/figures/:slug/edit' do 
    @figure = Figure.find_by_slug(params[:slug])
    erb :'/figures/edit'
  end

  post '/figures/:slug' do 
    @figure = Figure.find_by_slug(params[:slug])
    @figure.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @figure.genre_ids = params[:genres]
    @figure.save
    erb :'figures/show', locals: {message: "Figure successfully updated."}
  end

end