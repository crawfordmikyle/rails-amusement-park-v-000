class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.valid?
      redirect_to attraction_path(@attraction)
    else
      render 'new'
    end
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    if @attraction
      render :show
    else
      redirect_to attractions_url
    end
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def attraction_params
  params.require(:attraction).permit(
    :name,
    :min_height,
    :tickets,
    :happiness_rating,
    :nausea_rating
  )
end
end
