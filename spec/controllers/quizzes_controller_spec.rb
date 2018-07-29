require 'spec_helper'

describe QuizzesController, type: :controller do

    
    describe "GET #new" do
        it "renders the :new template" do
            get :new
            expect(response).to be_success
        end
    end
    
    describe "POST #create" do
        context "valid attributes" do
            it "create a @quiz for user" do
                expect(response).to have_content("#")
            end
        end
    end

    describe "GET #show" do
        it "renders the :show template" do
            expect(response).to be_success
        end
    end
end