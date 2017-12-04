require 'rails_helper'

RSpec.describe DealsController, type: :controller do
  it "handles a missing deal correctly" do
    get :show, id: "not-here"

    expect(response).to redirect_to(deals_path)

    message = "The deal you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end
  it "handles permission errors by redirecting to a safe place" do
    allow(controller).to receive(:current_user)

    deal = FactoryGirl.create(:deal)
    get :show, id: deal

    expect(response).to redirect_to(root_path)
    message = "You aren't allowed to do that."
    expect(flash[:alert]).to eq message
  end
end
