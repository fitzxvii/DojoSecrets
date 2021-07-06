require 'rails_helper'
RSpec.describe UsersController, type: :controller do
    before do
        @user = create(:user)
    end

    context "when not logged in" do
        before do
            session[:user_id] = nil
        end

        it "cannot access show" do 
            get :show, params: { id: @user }
            expect(response).to redirect_to("/")
        end

        it "cannot access edit" do
            get :edit, params: { id: @user }
            expect(response).to redirect_to("/")
        end

        it "cannot access update" do
            post :update, params: { id: @user }
            expect(response).to redirect_to("/")
        end

        it "cannot access destroy" do
            delete :destroy, params: { id: @user }
            expect(response).to redirect_to("/")
        end
    end
end