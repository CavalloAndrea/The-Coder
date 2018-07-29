require 'spec_helper'

describe TutorialsController, type: :controller do
    
    describe "GET #new" do
        it "renders the :new template" do
            get :new
            expect(response).to be_success
        end
    end
    
    describe "POST #create" do
        context "valid attributes" do
            it "create a @tutorial for user" do
                expect(response).to have_content("#")
            end
        end
    end

    describe "GET #show" do
        it "renders the :show template" do
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
            get :searching
            expect(response).to be_success
        end
    end
end