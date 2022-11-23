class Api::V1::ProfilesController < ApplicationController
  before_action :authenticate_api_v1_user!
  
  def index
    @profiles = Profile.all.includes(:user)
    render json: @profiles
  end
end
