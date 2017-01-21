require 'test_helper'

class RssItemsControllerTest < ActionController::TestCase
  setup do
    @rss_item = rss_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rss_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rss_item" do
    assert_difference('RssItem.count') do
      post :create, rss_item: { guid: @rss_item.guid, item: @rss_item.item, pubDate: @rss_item.pubDate }
    end

    assert_redirected_to rss_item_path(assigns(:rss_item))
  end

  test "should show rss_item" do
    get :show, id: @rss_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rss_item
    assert_response :success
  end

  test "should update rss_item" do
    patch :update, id: @rss_item, rss_item: { guid: @rss_item.guid, item: @rss_item.item, pubDate: @rss_item.pubDate }
    assert_redirected_to rss_item_path(assigns(:rss_item))
  end

  test "should destroy rss_item" do
    assert_difference('RssItem.count', -1) do
      delete :destroy, id: @rss_item
    end

    assert_redirected_to rss_items_path
  end
end
