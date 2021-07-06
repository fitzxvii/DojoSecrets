require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
    before do
        @user = create(:user)
        @secret = create(:secret, user: @user)
    end
    context "when not logged in" do
        before do
            session[:user_id] = nil
        end

        it "cannot access index" do
            get :index
            expect(response).to redirect_to('/')
        end

        it "cannot access create" do
            post :new
            expect(response).to redirect_to('/')
        end

        it "cannot access destroy" do
            delete :destroy, params: { id: @secret }
            expect(response).to redirect_to('/')
        end
    end
end