require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #new" do
        it "renders the new template" do
            get :new
        end
    end

    describe "POST #create" do
        context "with valid params" do
            it "redirects to the goal index" do
                post :create, params: { user: { username: "Johnjohn", password: "halo123456" } }
                expect(response).to redirect_to(goals_url)
            end
        end

        context "with invalid params" do
            it "renders the new template" do
                post :create, params: { user: { username: "Johnjohn"} }
                expect(flash.now[:errors]).to be_present
                expect(response).to render_template("new")
            end
        end
    end
end
