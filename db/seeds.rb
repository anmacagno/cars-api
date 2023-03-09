# frozen_string_literal: true

require 'net/http'

MODELS_URL = 'https://raw.githubusercontent.com/remigioamc/nexu-backend-test/master/models.json'

Rails.logger = Logger.new($stdout)
Rails.logger.level = Logger::INFO

response = Net::HTTP.get(URI(MODELS_URL))
models = JSON.parse(response, symbolize_names: true)

Rails.logger.info("Processing #{models.size} models...")

models.each do |model|
  brand = Brand.find_or_create_by!(name: model[:brand_name])
  brand.models.create!(name: model[:name], average_price: model[:average_price])
rescue StandardError => e
  Rails.logger.error("Error inserting model with id #{model[:id]}. #{e.message}.")
end
