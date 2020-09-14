require "unleashed_client/version"
require_relative 'http/http_client'
require 'httparty'

module UnleashedClient
  class SalesOrder
    attr_reader :api_key, :api_id

    def initialize(api_key:, api_id:, query: "")
      @api_key = api_key
      @api_id = api_id
      @query = query
      @unleashed_model = 'SalesOrders'
    end
    
    def get_number_of_pages
      response = HTTP::Client.get(api_id: @api_id, api_key: @api_key, query: @query, unleashed_model: @unleashed_model)
      response["Pagination"]["NumberOfPages"]
    end

    def get_first_200
      response = HTTP::Client.get(api_id: @api_id, api_key: @api_key, query: @query, unleashed_model: @unleashed_model)
      response["Items"]
    end

    def get_orders_from_page(page_number:)
      response = HTTP::Client.get_from_page(api_id: @api_id, api_key: @api_key, query: @query, unleashed_model: @unleashed_model, page_number: page_number)
      response["Items"]
    end

    def get_details(guid:)
      HTTP::Client.get_with_guid(api_id: @api_id, api_key: @api_key, query: @query, unleashed_model: @unleashed_model, guid: guid)
    end
  end
end
