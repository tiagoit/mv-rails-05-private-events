require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "layout links with non logged user" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", login_path, count: 1
  end

  test "layout links with logged user" do
    log_in_as(@user.email)
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", logout_path, count: 1
  end
end
