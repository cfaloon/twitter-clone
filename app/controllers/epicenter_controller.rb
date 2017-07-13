class EpicenterController < ApplicationController

  before_action :authenticate_user!
  
  def feed
    @following_tweets = Tweet.where(user_id: current_user.following + [current_user.id]).order(created_at: :desc)   
  end

  def show_user
    @user = User.find_by(username: params[:username])
    redirect_to root_path if @user.nil?
  end

  def now_following
    user = User.find(params[:id].to_i)
    current_user.following.push(user.id)
    current_user.save

    redirect_to show_user_path(user.username)
  end

  def unfollow
    user = User.find(params[:id].to_i)
    current_user.following.delete(user.id)
    current_user.save

    redirect_to show_user_path(user.username)
  end

  def tag_tweets
    @tag = Tag.find(params[:id])
  end

  def all_users
    @users = User.all
  end

  def following
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if @user.following.include?(user.id)
        @users.push(user)
      end
    end
  end

  def followers
    @user = User.find(params[:id])
    @users = []
    
    User.all.each do |user|
      if user.following.include?(@user.id)
        @users.push(user)
      end
    end
  end
end
