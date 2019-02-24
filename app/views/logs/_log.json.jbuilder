json.extract! log, :id, :table, :row, :column, :changed_to, :changed_at, :changed_by, :created_at, :updated_at
json.url log_url(log, format: :json)
