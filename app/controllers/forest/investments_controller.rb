class Forest::InvestmentsController < ForestLiana::ApplicationController
  def validate
    investment_id = params.dig('data', 'attributes', 'ids').first
    Investment.update(investment_id, status: 'approved')
    InvestmentMailer.validated(investment_id).deliver_later

    head :no_content
  end
end

