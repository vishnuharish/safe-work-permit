require 'test_helper'

class SafeWorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @safe_work = safe_works(:one)
  end

  test "should get index" do
    get safe_works_url
    assert_response :success
  end

  test "should get new" do
    get new_safe_work_url
    assert_response :success
  end

  test "should create safe_work" do
    assert_difference('SafeWork.count') do
      post safe_works_url, params: { safe_work: {  } }
    end

    assert_redirected_to safe_work_url(SafeWork.last)
  end

  test "should show safe_work" do
    get safe_work_url(@safe_work)
    assert_response :success
  end

  test "should get edit" do
    get edit_safe_work_url(@safe_work)
    assert_response :success
  end

  test "should update safe_work" do
    patch safe_work_url(@safe_work), params: { safe_work: {  } }
    assert_redirected_to safe_work_url(@safe_work)
  end

  test "should destroy safe_work" do
    assert_difference('SafeWork.count', -1) do
      delete safe_work_url(@safe_work)
    end

    assert_redirected_to safe_works_url
  end
end
