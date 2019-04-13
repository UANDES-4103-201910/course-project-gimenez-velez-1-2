require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get [create" do
    get events_[create_url
    assert_response :success
  end

  test "should get update" do
    get events_update_url
    assert_response :success
  end

  test "should get delete]" do
    get events_delete]_url
    assert_response :success
  end

end
