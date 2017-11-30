require 'rails_helper'

RSpec.describe DealsController, type: :controller do
  it "handles a missing deal correctly" do
    get :show, id: "not-here"

    expect(response).to redirect_to(deals_path)

    message = "The deal you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end
end
