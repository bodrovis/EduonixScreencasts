require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "creating new post" do
    VCR.use_cassette("moscow weather") do
      visit new_post_url

      assert_selector "h1", text: "New Post"

      body = 'This is my test post'
      fill_in "post[body]", with: body
      click_on "Create Post"

      assert_text body
    end
  end

  test 'all posts page should also display weather information' do
    VCR.use_cassette("moscow weather") do
      visit posts_url
      within '#weather-status' do
        assert_text 'Temperature is 8'
      end
    end
  end
end
