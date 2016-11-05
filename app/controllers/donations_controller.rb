class DonationsController < ApplicationController
  # POST /donations
  def create
    donor = find_or_build_donor(donation_params.delete(:donor))
    @donation = Donation.new(donation_params.merge(donor: donor))

    respond_to do |format|
      if @donation.save
        format.js {}
        format.html {}
        redirect_to donor_path(@donation.donor), notice: "Donation was successfully created."
      else
        format.js
      end
    end
  end

  def index
    @donations = Donation.all
  end

  # PATCH /update
  def update
    @donation = find_donation(params[:id])

    respond_to do |format|
      if @donation.update(donation_params)
        format.js {}
        format.html {}
        redirect_to donor_path(@donation.donor), notice: "Donation was successfully updated."
      else
        format.js
      end
    end
  end

  # GET /edit
  def edit
    @donation = find_donation(params[:id])

    respond_to do |format|
      format.js
    end
  end

  private

  def find_donation(id)
    Donation.find(id)
  end

  def find_or_build_donor(id)
    Donor.find_or_initialize_by(id)
  end

  def donation_params
    params.require(:donation).permit(:amount, :cause_id, :event_id, :created_at, donor: [:identification])
  end
end
