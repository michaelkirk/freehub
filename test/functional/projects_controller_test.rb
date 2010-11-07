require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  
  def setup
    super
    login_as 'sfbk'
  end

  test "should get index" do
    get :index, :organization_key => 'sfbk', :person_id => people(:mary)
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new, :organization_key => 'sfbk', :person_id => people(:mary)
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, :organization_key => 'sfbk', :person_id => people(:mary), :project => { }
    end

    assert_redirected_to project_path(:id => assigns(:project), :organization_key => :sfbk, :person_id => people(:mary))
  end

  test "should show project" do
    get :show, :organization_key => :sfbk, :person_id => people(:mary),:id => projects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :organization_key => :sfbk, :person_id => people(:mary),:id => projects(:one).to_param
    assert_response :success
  end

  test "should update project" do
    put :update, :organization_key => :sfbk, :person_id => people(:mary), :id => projects(:one).to_param, :project => { }
    assert_redirected_to project_path(:id => assigns(:project), :organization_key => :sfbk, :person_id => people(:mary))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, :organization_key => :sfbk, :person_id => people(:mary),:id => projects(:one).to_param
    end

    assert_redirected_to projects_path, :organization_key => :sfbk, :person_id => people(:mary)
  end
  
  test "should update worked on date" do
    get :work_done, :organization_key => :sfbk, :person_id => people(:mary), :project_id => projects(:one)
    assert_equal assigns(:project).last_work_done.to_time, DateTime.now.to_time
  end
end
