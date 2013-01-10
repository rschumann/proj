require 'test_helper'

class GroupTasksOrdersControllerTest < ActionController::TestCase
  setup do
    @group_tasks_order = group_tasks_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_tasks_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_tasks_order" do
    assert_difference('GroupTasksOrder.count') do
      post :create, group_tasks_order: { group_id: @group_tasks_order.group_id, order: @group_tasks_order.order, task_id: @group_tasks_order.task_id }
    end

    assert_redirected_to group_tasks_order_path(assigns(:group_tasks_order))
  end

  test "should show group_tasks_order" do
    get :show, id: @group_tasks_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_tasks_order
    assert_response :success
  end

  test "should update group_tasks_order" do
    put :update, id: @group_tasks_order, group_tasks_order: { group_id: @group_tasks_order.group_id, order: @group_tasks_order.order, task_id: @group_tasks_order.task_id }
    assert_redirected_to group_tasks_order_path(assigns(:group_tasks_order))
  end

  test "should destroy group_tasks_order" do
    assert_difference('GroupTasksOrder.count', -1) do
      delete :destroy, id: @group_tasks_order
    end

    assert_redirected_to group_tasks_orders_path
  end
end
