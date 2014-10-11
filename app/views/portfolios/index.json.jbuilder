json.array!(@portfolios) do |portfolio|
  json.extract! portfolio, :id, :title, :description, :work, :user_id
  json.url portfolio_url(portfolio, format: :json)
end
