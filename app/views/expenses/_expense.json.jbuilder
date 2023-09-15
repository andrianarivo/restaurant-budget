json.extract! expense, :id, :name, :author_id, :amount, :created_at, :updated_at
json.url expense_url(expense, format: :json)
