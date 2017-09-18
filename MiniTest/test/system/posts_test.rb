require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "creating new post" do
    visit new_post_url

    assert_selector "h1", text: "New Post"

    body = 'This is my test post'
    fill_in "post[body]", with: body
    click_on "Create Post"

    assert_text body
  end
end
