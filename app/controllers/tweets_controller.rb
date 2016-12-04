class TweetsController < ApplicationController

	before_action :twitter_client, except: :new
	def new
	  @tweet = Tweet.new
	end 

	def create
	  Tweet.create(create_params)
	  redirect_to :root
	end



    #画像アップロドできん
	def post
	  tweet = Tweet.order('rand()').first
	  status = tweet.text
	  @client.update(status)
	  redirect_to :root
	end

	def twitter_client
      @client = Twitter::REST::Client.new do |config|
	  	config.consumer_key = "utKIjysDj5i9rzohbudIiaAVx"
	  	config.consumer_secret = "rwlkHgyjp46sM8M1O45e1Uo3A1VaDrS7JFA8QIxaQvD1VR50zm"
	  	config.access_token = "797070219529175040-aQ14QsiQQE1m3KcEZlBYkl8mmNTzB4X"
	  	config.access_token_secret = "3vh9PlyxfCnzkSynTafPe5maabAnUHrGrNt4Ypq3xiWcW"
	  end
	end

	private

	def create_params
	  params.require(:tweet).permit(:text, :image)
	end


end
