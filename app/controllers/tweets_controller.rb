class TweetsController < ApplicationController
  layout :get_layout

  # GET /tweets
  # GET /tweets.json
  def index1
    SyncData.process
  end

  def index

    if params[:id].present?
      @cat = params[:id]
    else
      @cat = "digital"
    end
    @tweets = Tweet.findtweets(@cat,nil,0)
  end

  def filtertweet
    if params[:category].present?
      @tweets = Tweet.findtweets(params[:category], params[:filter], params[:page])
      @mode = params[:mode]
    end
  end

  def fastsignup
    if params[:user][:email].present?
      @u = Waitlist.new
      @u.email = params[:user][:email]
      @u.save
    end
  end

  private
  def get_layout
    'tweets'
  end
end
