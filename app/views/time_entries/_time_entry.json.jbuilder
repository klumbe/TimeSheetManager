json.extract! time_entry, :id, :date, :start, :end, :breaks, :total, :created_at, :updated_at
json.url time_entry_url(time_entry, format: :json)
