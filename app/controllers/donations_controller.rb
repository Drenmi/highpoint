class DonationsController < ApplicationController
  # POST /donations
  def create
    donor = find_or_build_donor(donation_params.delete(:donor))
    @donation = Donation.new(donation_params.merge(donor: donor))

    if @donation.save
      redirect_to donor_path(@donation.donor), notice: "Donation was successfully created."
    else
      redirect_to :back, error: @donation.errors.full_messages.to_sentence
    end
  end

  # PATCH /update
  def update
    @donation = find_donation(params[:id])

    if @donation.update(donation_params)
      redirect_to donor_path(@donation.donor), notice: "Donation was successfully updated."
    else
      redirect_to donor_path(@donation.donor), error: "Failed to update donation."
    end
  end

  # GET /edit
  def edit
    @donation = find_donation(params[:id])

    render :edit
  end

  private

  def find_donation(id)
    Donation.find(id)
  end

  def find_or_build_donor(id)
    Donor.find_or_initialize_by(id)
  end

  def donation_params
    params.require(:donation).permit(:amount, :cause_id, :event_id, donor: [:identification])
  end
end
