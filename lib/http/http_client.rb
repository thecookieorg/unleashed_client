require_relative 'auth'
require 'httparty'

module HTTP
  class Client
    API_URL = "https://api.unleashedsoftware.com"

    class << self
      def get(api_id:, api_key:, query:, unleashed_model:)
        headers = generate_signature_and_headers(api_key: api_key, api_id: api_id, query: query)
        
        url = "#{API_URL}/#{unleashed_model}"
        HTTParty.get(url, headers: headers)
      end

      def get_with_guid(api_id:, api_key:, query:, unleashed_model:, guid:)
        headers = generate_signature_and_headers(api_key: api_key, api_id: api_id, query: query)

        url = "#{API_URL}/#{unleashed_model}/#{guid}"
        HTTParty.get(url, headers: headers)
      end

      def get_from_page(api_id:, api_key:, query:, unleashed_model:, page_number:)
        headers = generate_signature_and_headers(api_key: api_key, api_id: api_id, query: query)

        url = "#{API_URL}/#{unleashed_model}/Page/#{page_number}"
        response = HTTParty.get(url, headers: headers)
        response["Items"]
      end

      private

      def generate_signature_and_headers(api_key:, api_id:, query:)
        signature = Auth.get_signature(api_key: api_key, query: query)

        {
          "Content-Type" => "application/json",
          "Accept" => "application/json",
          "api-auth-id" => api_id,
          "api-auth-signature" => signature
        }
      end
    end
  end
end