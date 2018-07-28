require 'spec_helper'

require 'spec_helper'

describe UsersController, type: :controller do
    before(:all) do
        @user = create(:user)
    end
    
    after(:all) do
        @user.destroy
    end
    
    describe "GET #new" do
        it "renders the :new template" do
            get :new
            expect(response).to be_success
        end
    end
    
    describe "GET #edit" do
        it "renders the :edit template" do
            log_in(@user)
            get :edit, params: { id: @user.id }
            expect(response).to be_success
        end
    end
end