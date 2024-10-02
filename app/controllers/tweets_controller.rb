class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.tdate = Time.current 
    
    if @tweet.save
      redirect_to tweets_path, notice: "ツイートが正常に作成されました。"
    else
      flash.now[:error] = "エラー: " + @tweet.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "ツイートが正常に更新されました。"
    else
      flash.now[:error] = @tweet.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "ツイートが正常に削除されました。"
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:message)
  end
end