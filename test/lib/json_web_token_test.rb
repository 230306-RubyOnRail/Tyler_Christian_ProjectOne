require_relative '../../lib/json_web_token.rb'
require 'test_helper'
class JsonWebTokenTest < ActiveSupport::TestCase
    test 'the truth' do
        assert true
    end

    test 'encode' do
        subject = { 'foo' => 'bar' }
        token = JsonWebToken.encode(subject)
        assert token.is_a?(String)
    end

    def self.decode(token)
        JWT.decode(token, Rails.application.credentials.jwt_token_secret, true, { algorithm: 'HS256' })[0]
      rescue JWT::ExpiredSignature, JWT::VerificationError => e
        raise JWT::ExpiredSignature, e.message
      rescue JWT::DecodeError, JWT::VerificationError => e
        raise JWT::DecodeError, e.message
      end
end