class CalendersController < ApplicationController
  #カレンダーテーブルから全て取得
  def index
    @calenders = Calender.all
  end

#新規登録画面
  def new
    #カレンダーのレコードをセット
    @calender = Calender.new
  end

  #登録処理
  def create
    @calender = Calender.new(calender_params)
    if @calender.save
      flash[:success] = "登録しました"
      @calenders = Calender.all
      redirect_to calenders_url
    else
      flash.now[:danger] = "なにかちがう"
      render :new
    end
  end

  private

  #パラメータ登録
  def calender_params
    params.require(:calender).permit(:start_time)
  end

end