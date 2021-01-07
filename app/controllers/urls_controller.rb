class UrlsController < ApplicationController
  before_action :set_url, only: %i[show destroy]

  def index
    urls = Url.select(:id, :name, :original_url)

    respond_to do |format|
      format.html
      format.json { render json: urls, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: { original_url: @url.original_url }, status: :ok }
    end
  end

  def create
    url = Url.new(url_params)

    if url.save
      render json: url, status: :created
    else
      render json: { errors: url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Url destroyed', status: :ok } if @url.destroy
  end

  private

  def url_params
    params.require(:url).permit(:name, :original_url, :shortner_url)
  end

  def set_url
    @url = Url.find(params[:id])
  end
end
