require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest
  def setup
    # @user = User.create(username: "testman", email: "testman@example.com", password: "password", admin: true)
  end


  test "get start and sign up a user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
     post_via_redirect users_path, user: {username: "testman", email: "testman@example.com", password: "password", admin: true}
    end
    @user_id = session[:user_id]
    assert_template "users/show", params: {id: @user_id}
  #       puts "1 #{User.find_by(email: 'testman@example.com')}"
  # end
  #
  # test "log out and sign in again" do
    puts "2 #{User.find_by(email: 'testman@example.com')}"
    delete logout_path
    get login_path
    assert_no_difference 'User.count' do
       post_via_redirect login_path, session: {email: "testman@example.com", password: "password"}
    end
    @user_id = session[:user_id]

    assert_template "users/show"
  end



end
