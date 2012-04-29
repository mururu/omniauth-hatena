# -*- coding: utf-8 -*-
require 'omniauth/strategies/oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Hatena < OmniAuth::Strategies::OAuth

      DEFAULT_SCOPE = "read_public"

      option :name, 'hatena'
      option :authorize_options, [:scope]
      option :client_options, {
        :request_token_url => 'https://www.hatena.com/oauth/initiate',
        :access_token_url  => 'https://www.hatena.com/oauth/token',
        :authorize_url     => 'https://www.hatena.ne.jp/oauth/authorize'
      }

      uid { raw_info[:url_name] }

      info do
        {
          :name     => raw_info[:url_name],
          :nickname => raw_info[:display_name],
          :image    => raw_info[:profile_image_url],
          :urls     => { 'Hatena' => 'http://www.hatena.ne.jp/' + raw_info['url_name'] }
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.load(access_token.get('http://n.hatena.com/applications/my.json').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      alias :old_request_phase :request_phase

      def request_phase
        params = (options.scope || '').split(',').map(&:strip)
        options.request_params[:scope] = params.push(DEFAULT_SCOPE).join(',')

        old_request_phase
      end
    end
  end
end
