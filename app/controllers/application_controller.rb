class ApplicationController < ActionController::Base
  include Clearance::Controller

  protect_from_forgery with: :exception

  before_action :require_login, :prepare_modal_donation

  private

  def prepare_modal_donation
    @modal_donation = Donation.new
    @modal_donation.build_donor
  end
end
