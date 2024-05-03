require "test_helper"

class FornecedoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fornecedores_index_url
    assert_response :success
  end
end
