class ApplicationController < ActionController::Base
  add_flash_types :warning, :error, :success

  include Clearance::Controller

  protect_from_forgery with: :exception

  before_action :require_login, :prepare_modal_donation, :set_paper_trail_whodunnit

  private

  def prepare_modal_donation
    @modal_donation = Donation.new
    @modal_donation.build_donor
  end

  def safe_params(unsafe = {})
    params.merge(unsafe).merge(only_path: true)
  end
  helper_method :safe_params
end
