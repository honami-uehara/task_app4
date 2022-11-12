class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
     @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_at, :end_at, :all_day,:memo))
    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :schedules
    else
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule = Schedule.update(params.require(:schedule).permit(:title, :start_at, :end_at, :all_day, :memo))
    flash[:notice] = "スケジュールを更新しました"
    redirect_to :schedule
    else
     render "edit"
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :schedules
  end
end
end
