require 'rails_helper'
RSpec.describe LikesController, type: :controller do 
    before do 
        @user = create(:user)
        @secret = create(:secret, user: @user)
        @like = create(:like, secret: @secret, user: @user)
    end

    context "when not logged in " do 
        before do 
            session[:user_id] = nil
        end
        
        it "cannot create a like" do
            post :create, params: { id: @secret }
            expect(response).to redirect_to('/')
        end

        it "cannot destroy a like" do
            delete :destroy, params: { id: @secret }
            expect(response).to redirect_to('/')
        end 
    end

    context "when signed in as the wrong user" do
        before do
            @user2 = create(:user, name: "Another User", email: "user@yahoo.com")
            session[:user_id] = @user.id
        end
        it "shouldn't be able to destroy a like" do
            delete :destroy, params: { id: @secret }
            expect(response).to redirect_to("/secrets")
        end
    end 
end