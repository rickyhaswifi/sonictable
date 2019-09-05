class ChartsController < ApplicationController
  before_action :set_chart, only: [:show, :edit, :update, :destroy]


  def index
    @charts = Chart.all
  end

  def show
  end

  def new
    @chart = Chart.new
  end


  def create
    @chart = Chart.new(chart_params)

    if @chart.save
      redirect_to @chart
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @chart.update(chart_params)
      redirect_to @chart
    else
      render :new
    end
  end

  def destroy
    @chart.destroy
    redirect_to songs_path
  end

  private
  def chart_params
    params.require(:chart).permit(:title)
  end

  def set_chart
    @chart = Chart.find(params[:id])
  end 


  
end
