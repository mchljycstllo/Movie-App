require 'test_helper'

#module Api
  class ArtistsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @artist = artists(:one)
    end

    test "should get index" do
      get artists_url, as: :json
      assert_response :success
    end

    test "should create artist" do
      assert_difference('Artist.count') do
        post artists_url, params: { artist: {
          full_name: 'test artist name'
        } }, as: :json
      end

      assert_response 201
    end

    test "should show artist" do
      get artist_url(@artist), as: :json
      assert_response :success
    end

    test "should update artist" do
      patch artist_url(@artist), params: { artist: {
        full_namae: 'test artist name'
      } }, as: :json
      assert_response 200
    end

    test "should destroy artist" do
      assert_difference('Artist.count', -1) do
        delete artist_url(@artist), as: :json
      end

      assert_response 204
    end
  end
#end
