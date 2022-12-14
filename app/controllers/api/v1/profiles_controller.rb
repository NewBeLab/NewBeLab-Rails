class Api::V1::ProfilesController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_profile, only: %i[show update]

  def index
    @profiles = Profile.all.includes(:user)
    @user_profiles = @profiles.map do |profile|
      {profile: profile, name: profile.user.name, image: profile.user.image}
    end
    render json: @user_profiles
  end

  def show
    @profile ||= Profile.create!(user_id: current_api_v1_user.id)
    render json: { profile: @profile, tags: @profile.tags }
  end

  def update
    @profile.assign_attributes(profile_params)
    if @profile.save_with_tags(name: params.dig(:profile, :tags).split(',').uniq)
      render json: @profile
    else
      render json: @profile.errors, status: :bad_request
    end
  end

  private

  def set_profile
    @profile = Profile.find_by(user_id: current_api_v1_user.id)
  end

  def profile_params
    params.require(:profile).permit(:times_link, :commitment, :position, :motivation, :self_introduction, :phase, :grade, :editor)
  end
end
