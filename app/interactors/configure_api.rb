BoletoSimples.configure do |c|
  c.api_token = ENV.fetch('KOBANA_TOKEN')
  c.user_agent = 'gizele.ccardoso@gmail.com'
end
