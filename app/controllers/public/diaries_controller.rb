class Public::DiariesController < ApplicationController
  def index
   @diaries = Diary.all
  end

  def new
    @diary = Diary.new
    @emotions = Emotion.all
    @diary.image_emotions.build
  end

  def create
    @diary = Diary.new(diary_params)
    # require 'date'
    @diary.start_time = DateTime.current
    @diary.user_id = current_user.id
    @diary.save

    # @emotions = Emotion.all

    # @diary_emotion = DiaryEmotion.new(diary_emotion_params)
    # @diary_emotion.diary_id = @diary.id
    # @diary_emotion.emotion_id = emotion.id
    # @diary_emtoion.save
    redirect_to diary_path(@diary.id)
  end

  def show
    @diary = Diary.find(params[:id])
  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :diary_detail, :start_time, :is_favorited, image: [],
    image_emotions_attributes: [:id, :emotion_id, :_destroy]
    )
  end

  # def diary_emotion_params
  #   params.require(:diary_emotion).permit(:diary_id, emotion_id)
  # end

end
