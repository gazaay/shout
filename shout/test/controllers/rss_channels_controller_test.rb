require 'test_helper'

class RssChannelsControllerTest < ActionController::TestCase
  setup do
    @rss_channel = rss_channels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rss_channels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rss_channel" do
    assert_difference('RssChannel.count') do
      post :create, rss_channel: { blogChannel: @rss_channel.blogChannel, category: @rss_channel.category, copyright: @rss_channel.copyright, description: @rss_channel.description, docs: @rss_channel.docs, generator: @rss_channel.generator, language: @rss_channel.language, lastBuildDate: @rss_channel.lastBuildDate, link: @rss_channel.link, managingEditor: @rss_channel.managingEditor, title: @rss_channel.title, webMaster: @rss_channel.webMaster }
    end

    assert_redirected_to rss_channel_path(assigns(:rss_channel))
  end

  test "should show rss_channel" do
    get :show, id: @rss_channel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rss_channel
    assert_response :success
  end

  test "should update rss_channel" do
    patch :update, id: @rss_channel, rss_channel: { blogChannel: @rss_channel.blogChannel, category: @rss_channel.category, copyright: @rss_channel.copyright, description: @rss_channel.description, docs: @rss_channel.docs, generator: @rss_channel.generator, language: @rss_channel.language, lastBuildDate: @rss_channel.lastBuildDate, link: @rss_channel.link, managingEditor: @rss_channel.managingEditor, title: @rss_channel.title, webMaster: @rss_channel.webMaster }
    assert_redirected_to rss_channel_path(assigns(:rss_channel))
  end

  test "should destroy rss_channel" do
    assert_difference('RssChannel.count', -1) do
      delete :destroy, id: @rss_channel
    end

    assert_redirected_to rss_channels_path
  end
end
