class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :prepare_modal_donation

  private

  def prepare_modal_donation
    @modal_donation = Donation.new
  end
end
