class Public::DiariesController < ApplicationController
  def index
   @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    require 'date'
    @diary.start_time = DateTime.current
    @diary.user_id = current_user.id
    @diary.save
    redirect_to diary_path(@diary.id)
  end

  def show
    @diary = Diary.find(params[:id])
  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :diary_detail, :start_time, :is_favorited, image: [])
  end

end
