# frozen_string_literal: true

# Class responsible for the configuration to the connect into the API
BoletoSimples.configure do |c|
  c.api_token = ENV.fetch('KOBANA_TOKEN')
  c.user_agent = 'gizele.ccardoso@gmail.com'
end
