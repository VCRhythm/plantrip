require 'test_helper'

class MarketsControllerTest < ActionController::TestCase
  setup do
    @market = markets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:markets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create market" do
    assert_difference('Market.count') do
      post :create, market: { bakedgoods: @market.bakedgoods, city: @market.city, credit: @market.credit, latitude: @market.latitude, location: @market.location, longitude: @market.longitude, maple: @market.maple, meat: @market.meat, name: @market.name, nursery: @market.nursery, nuts: @market.nuts, plants: @market.plants, poultry: @market.poultry, prepared: @market.prepared, soap: @market.soap, state: @market.state, street: @market.street, trees: @market.trees, updatetime: @market.updatetime, website: @market.website, wine: @market.wine, zip: @market.zip }
    end

    assert_redirected_to market_path(assigns(:market))
  end

  test "should show market" do
    get :show, id: @market
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @market
    assert_response :success
  end

  test "should update market" do
    patch :update, id: @market, market: { bakedgoods: @market.bakedgoods, city: @market.city, credit: @market.credit, latitude: @market.latitude, location: @market.location, longitude: @market.longitude, maple: @market.maple, meat: @market.meat, name: @market.name, nursery: @market.nursery, nuts: @market.nuts, plants: @market.plants, poultry: @market.poultry, prepared: @market.prepared, soap: @market.soap, state: @market.state, street: @market.street, trees: @market.trees, updatetime: @market.updatetime, website: @market.website, wine: @market.wine, zip: @market.zip }
    assert_redirected_to market_path(assigns(:market))
  end

  test "should destroy market" do
    assert_difference('Market.count', -1) do
      delete :destroy, id: @market
    end

    assert_redirected_to markets_path
  end
end
