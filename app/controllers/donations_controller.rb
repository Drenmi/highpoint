class DonationsController < ApplicationController
  # POST /donations
  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      redirect_to donations_path, notice: "Donation was successfully created."
    else
      redirect_to donations_path, error: "Failed to save donation."
    end
  end

  private

  def find_donation
    Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:amount)
  end
end
