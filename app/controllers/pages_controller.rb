class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home; end

  def toggle_owner_view
    current_user.update!(owner: !current_user.owner)
    redirect_back(fallback_location: gyms_path)
  end
end
