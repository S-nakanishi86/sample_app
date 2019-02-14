require 'test_helper'

class UsersNonActivatedIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @non_activated_user = users(:non_activated)
  end

  test "should not allow the not activated attribute" do
    log_in_as(@non_activated_user)
    assert_not @non_activated_user.activated?
    get users_path
    assert_select "a[href=?]", user_path(@non_activated_user), count: 0
    get user_path(@non_activated_user)
    assert_redirected_to root_url
  end
  # test "the truth" do
  #   assert true
  # end
end
