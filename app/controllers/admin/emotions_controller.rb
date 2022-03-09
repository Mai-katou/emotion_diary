class Admin::EmotionsController < ApplicationController
  def new
    @emotion = Emotion.new
  end

  def create
    @emotion = Emotion.new(emotion_params)
    @emotion.save
    redirect_to admin_emotions_path
  end

  def index
    @emotions = Emotion.all
  end

  def edit
    @emotion = Emotion.find(params[:id])
  end

  def update
    @emotion = Emotion.find(params[:id])
    @emotion.update(emotion_params)
    redirect_to admin_emotions_path
  end

  def destroy
    @emotion = Emotion.find(params[:id])
    @emotion.destroy
    redirect_to admin_emotions_path
  end

  private

  def emotion_params
    params.require(:emotion).permit(:emotion_name)
  end

end
