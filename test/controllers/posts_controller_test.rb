require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:valid)
  end

  def sign_in_user
    @user = users(:valid)
    sign_in @user
  end

  test 'Unauthenticated user should not get index' do
    get posts_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'should get index' do
    sign_in_user
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    sign_in_user
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in_user
    assert_difference('Post.count') do
      post posts_url, params: { post: { author_id: @post.author_id, content: @post.content, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    sign_in_user
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    sign_in_user
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    sign_in_user
    patch post_url(@post), params: { post: { author_id: @post.author_id, content: @post.content, title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    sign_in_user
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
