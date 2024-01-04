require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:valid)
  end

  test 'Post must be valid' do
    assert @post.valid?, 'Post in not valid'
  end

  test 'Post cant be without title' do
    @post.title = nil
    assert_not @post.valid?, 'Post is without title'
  end

  test 'Post cant be without content' do
    @post.content = nil
    assert_not @post.valid?, 'Post is without content'
  end

  test 'draft? returns true for draft post' do
    post = posts(:draft)
    assert post.draft?, 'Post is not draft'
  end

  test 'draft? returns false for published/scheduled post' do
    post1 = posts(:published)
    post2 = posts(:scheduled)
    assert_not post1.draft?, 'Post is draft'
    assert_not post2.draft?, 'Post is draft'
  end

  test 'published? returns true for published post' do
    post = posts(:published)
    assert post.published?, 'Post is not published'
  end

  test 'scheduled? returns true for scheduled post' do
    post = posts(:scheduled)
    assert post.scheduled?, 'Post is not scheduled'
  end
end
