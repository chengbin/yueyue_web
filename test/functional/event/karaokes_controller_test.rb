require 'test_helper'

class Event::KaraokesControllerTest < ActionController::TestCase
  setup do
    @event_karaoke = event_karaokes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_karaokes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_karaoke" do
    assert_difference('Event::Karaoke.count') do
      post :create, event_karaoke: { describe: @event_karaoke.describe, paytype: @event_karaoke.paytype, people_number_max: @event_karaoke.people_number_max, people_number_min: @event_karaoke.people_number_min, per_pay: @event_karaoke.per_pay, place: @event_karaoke.place, start_time: @event_karaoke.start_time, status: @event_karaoke.status, title: @event_karaoke.title }
    end

    assert_redirected_to event_karaoke_path(assigns(:event_karaoke))
  end

  test "should show event_karaoke" do
    get :show, id: @event_karaoke
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_karaoke
    assert_response :success
  end

  test "should update event_karaoke" do
    put :update, id: @event_karaoke, event_karaoke: { describe: @event_karaoke.describe, paytype: @event_karaoke.paytype, people_number_max: @event_karaoke.people_number_max, people_number_min: @event_karaoke.people_number_min, per_pay: @event_karaoke.per_pay, place: @event_karaoke.place, start_time: @event_karaoke.start_time, status: @event_karaoke.status, title: @event_karaoke.title }
    assert_redirected_to event_karaoke_path(assigns(:event_karaoke))
  end

  test "should destroy event_karaoke" do
    assert_difference('Event::Karaoke.count', -1) do
      delete :destroy, id: @event_karaoke
    end

    assert_redirected_to event_karaokes_path
  end
end
