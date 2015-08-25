module AuthServer
  class Strategy < OmniAuth::Strategies::OAuth2
    option :name, "auth_server"
    option :client_options, {
      site: "http://localhost:3000"
    }

    uid do
      raw_info['id']
    end

    info do
      { name: raw_info['name'] }
    end

    def raw_info
      @raw_info ||= access_token.get('/api/v1/me').parsed
    end
  end
end
