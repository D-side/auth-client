module AuthServer
  class Strategy < OmniAuth::Strategies::OAuth2
    option :name, "auth_server"
    option :client_options, {
      site: Figaro.env.provider_url
    }

    uid do
      raw_info['id']
    end

    info do
      { name: raw_info['name'] }
    end

    def raw_info
      @raw_info ||= access_token.get(Figaro.env.provider_credentials_path).parsed
    end
  end
end
