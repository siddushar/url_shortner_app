class Api::V1::LinksController < ApplicationController
  include RequestableWithErrors
  before_action :authenticate_token!

  def create
    link = Link.new(link_params)
    if link.save
        short_url = request.host_with_port + "/" + link.short_url
      render json: { short_url: short_url }, status: :created
    else
      render json: link.errors, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.permit(:original_url)
  end

end