# `birds controller`
class BirdsController < ApplicationController
  # GET /birds
  def index
    birds = Bird.all
    render json: birds, status: :ok
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, status: :ok
    else
      render json: { error: 'Bird not found' }, status: :not_found
    end
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # PATCH (update) /birds/:id
  def update
    bird = Bird.find(params[:id])
    if bird
      bird.update(bird_params)
      render json: bird, status: :accepted
    else
      render json: { error: 'Bird not found' }, status: :not_found
    end
  end

  def increment_likes
    bird = Bird.find(params[:id])
    if bird
      bird.update(likes: bird.likes + 1)
      render json: bird, status: :accepted
    else
      render json: { error: 'Bird not found' }, status: :not_found
    end
  end

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end
end
