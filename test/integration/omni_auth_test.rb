require 'test_helper'

class OmniAuthTest < ActionDispatch::IntegrationTest
  setup do
    @fake_auth_data = {
      uid: '12345',
      provider: 'auth_server',
      info: {
        name: 'Whatever'
      }
    }
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:auth_server, @fake_auth_data)
  end

  test "Home page displays user's name upon login" do
    get_via_redirect user_omniauth_authorize_path(:auth_server)
    assert_response :success
    assert response.body.include?(@fake_auth_data['info']['name'])
  end

  teardown do
    OmniAuth.config.test_mode = false
  end
end
