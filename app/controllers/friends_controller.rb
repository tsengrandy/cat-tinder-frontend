class FriendsController < ApplicationController
  def index
    friends = Friend.all
    render json: friends
  end

  def show
    friend = Friend.find(params[:id])
    render json: friend
  end

  def destroy
    Friend.find(params[:id]).destroy
  end

  def update
    friend = Friend.find(params[:id]).update(friend_params)
    render json: friend
  end

  def create
    friend = Friend.create(friend_params)
    if friend.valid?
      render json: friend
    else
      render json: friend.errors, status: :unprocessable_entity
    end
  end

  def friend_params
    params.require(:friend).permit(:name, :age, :enjoys)
  end

end
