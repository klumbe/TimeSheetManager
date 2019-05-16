CONFIG = {}
CONFIG[:azure_oauth2] = { 
  client_id: ENV['azure_oauth2_client_id'] || Rails.application.credentials[Rails.env.to_sym][:azure_oauth2][:client_id],
  tenant_id: ENV['azure_oauth2_tenant_id'] || Rails.application.credentials[Rails.env.to_sym][:azure_oauth2][:tenant_id],
  client_secret: ENV['azure_oauth2_client_secret'] || Rails.application.credentials[Rails.env.to_sym][:azure_oauth2][:client_secret]
  }
