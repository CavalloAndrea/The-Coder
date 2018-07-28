require 'spec_helper'

describe ProblemsController, type: :controller do
    before(:all) do
        @problem = create(:problem)
    end

    after(:all) do
        @problem.destroy
    end
    
    describe "GET #new" do
        it "renders the :new template" do
            get :new
            expect(response).to be_success
        end
    end
    
    describe "POST #create" do
        context "valid attributes" do
            it "create a @problem for user" do
                post :create, params: { id: @problem.id, problem: attributes_for(:problem)}
                expect(response).to redirect_to root_url
            end
        end
    end

    describe "GET #show" do
        it "renders the :show template" do
            get :show, params: { id: @problem.id }
            expect(response).to be_success
        end
    end
    
    describe "GET #index" do
        it "renders the :index template" do
            get :index
            expect(response).to be_success
        end
    end
    
    describe "GET #search" do
        it "renders the :search template" do
            get :search
            expect(response).to be_success
        end
    end
end