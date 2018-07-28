require 'spec_helper'

describe UsersController, type: :controller do
    
    describe "GET #new" do
        it "renders the :new template" do
            get :new
            expect(response).to be_success
        end
    end

    describe "GET #edit" do
        it "renders the :edit template" do
            edit_user_path(User.find(2))
            expect(response).to have_content("#")
        end
    end
end