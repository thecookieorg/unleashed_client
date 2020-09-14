require 'openssl'
require 'base64'

class Auth
  def self.get_signature(api_key:, query:)
    data = query ? query.force_encoding('UTF-8') : ''
    Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), api_key, data)).strip
  end
end