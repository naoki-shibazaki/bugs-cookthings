class CalendersController < ApplicationController
  #カレンダーテーブルから全て取得
  def index
    @calenders = Calender.all
  end

  #新規登録画面
  def new
    #カレンダーのレコードをセット
    @calender = Calender.new
    @calender.recipes.build
  end

  #登録処理
  def create
    start_time = params.require(:calender).permit(:start_time)
    st = Time.zone.local(start_time["start_time(1i)"].to_i,
                         start_time["start_time(2i)"].to_i,
                         start_time["start_time(3i)"].to_i, 0, 0, 0
    )
    if Calender.find_by(start_time: st)
      @calender = Calender.find_by(start_time: st)
      if @calender.update(calender_params)
        flash[:success] = "登録しました"
        @calenders = Calender.all
        redirect_to calender_url(@calender)
      else
        flash.now[:danger] = "なにかちがう"
        render :edit
      end
    else
      @calender = Calender.new(calender_params)
      if @calender.save
        flash[:success] = "登録しました"
        @calenders = Calender.all
        redirect_to calenders_url
      else
        flash.now[:danger] = "なにかちがう"
        render :edit
      end
    end
    
  end

  #参照編集
  def show
    @calender = Calender.find(params[:id])
  end

  #編集画面
  def edit
    @calender = Calender.find(params[:id])
  end

  #編集処理
  def update
    @calender = Calender.find(params[:id])
    if @calender.update(calender_params)
      flash[:success] = "更新しました"
      @calenders = Calender.all
      redirect_to calender_url(@calender)
    else
      flash.now[:danger] = "更新できまシェーン"
      render :edit
    end

    
  end

  #削除機能実装
  def destroy
    @calender = Calender.find(params[:id])
    @calender.destroy
    flash[:danger] = 'さくじょすますた'
    redirect_to calenders_url
  end


  #このコントローラーでしか使わない宣言
  private

  #パラメータ登録
  def calender_params
    params.require(:calender).permit(:start_time, recipes_attributes:[:recipe_name, :category])
  end


end