class Api::V1::TagsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    @tags = Tag.all
    render json: @tags
  end
end
