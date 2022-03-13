class Public::DiariesController < ApplicationController
  def index
   @diaries = Diary.where(user_id:current_user.id)
  end

  def new
    @diary = Diary.new
    @emotions = Emotion.all
    @diary.image_emotions.build
    @diary.images.build
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.start_time = DateTime.current
    @diary.user_id = current_user.id
    @diary.save
    redirect_to diary_path(@diary.id)
  end

  def show
    @diary = Diary.find(params[:id])
    @diaries = Diary.where(start_time: @diary.start_time.strftime("%Y/%m/%d 00:00:00") ... @diary.start_time.strftime("%Y/%m/%d 23:59:59")).where.not(id: @diary.id)
  end

  def edit
    @diary = Diary.find(params[:id])
    @emotions = Emotion.all
  end

  def calendar_detail
    @start_date = "#{params[:year]}/#{params[:month]}/#{params[:day]}"
    @diaries = Diary.where(start_time:("#{@start_date} 00:00:00" ... "#{@start_date} 23:59:59"))
  end

  def update
    @diary = Diary.find(params[:id])

    if params[:diary][:image_ids]
      params[:diary][:image_ids].each do |image_id|
        image = @diary.images.find(image_id)
        image.purge
      end
    end
    @diary.update(diary_params)
    redirect_to diary_path(@diary.id)

  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_back(fallback_location: root_path)
  end

  def favorited_diary
    @diaries = Diary.where(is_favorited:true,user_id:current_user.id)
  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :diary_detail, :start_time, :is_favorited, images: [],
    image_emotions_attributes: [:id, :emotion_id, :_destroy],
    )
  end

end
