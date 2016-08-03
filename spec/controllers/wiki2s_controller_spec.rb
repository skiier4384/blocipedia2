require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:my_user2) { User2.create!(name: "Blocipedia User", email: "user@blocipedia.com", password: "helloworld") }
  let(:my_wiki2) { Wiki2.create!(title: "Wiki Page", body: "This is a Wiki Page", private: true, user: my_user) }

   describe "GET index" do
     it "returns http success" do
       get :index
       expect(response).to have_http_status(:success)
     end
     
     it "assigns [my_wiki2] to @wiki2s" do
       get :index
       expect(assigns(:wiki2s)).to eq([my_wiki2])
     end
   end

   describe "GET show" do
     it "returns http success" do
       get :show, {id: my_wiki2.id}
       expect(response).to have_http_status(:success)
     end
     
     it "renders the #show view" do
       get :show, {id: my_wiki2.id}
       expect(response).to render_template :show
     end
 
     it "assigns my_wiki2 to @wiki2" do
       get :show, {id: my_wiki2.id}
       expect(assigns(:wiki2)).to eq(my_wiki2)
     end
   end
    
    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
 
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
 
      it "instantiates @wiki2" do
        get :new
        expect(assigns(:wiki2)).not_to be_nil
      end
   end
 
   describe "POST create" do
      it "increases the number of wiki2 by 1" do
        expect{post :create, wiki2: {title: "Wiki Page", body: "This is a Wiki Page"}}.to change(Wiki2,:count).by(1)
      end
 
      it "assigns the new wiki2 to @wiki2" do
        post :create, wiki2: {title: "Wiki Page", body: "This is a Wiki Page"}
        expect(assigns(:wiki2)).to eq Wiki2.last
      end
 
      it "redirects to the new wiki2" do
        post :create, wiki2: {title: "Wiki Page", body: "This is a Wiki Page"}
        expect(response).to redirect_to Wiki2.last
      end
    end

    describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_wiki2.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_wiki2.id}
       expect(response).to render_template :edit
     end
 
     it "assigns wiki2 to be updated to @wiki2" do
       get :edit, {id: my_wiki2.id}
 
       wiki2_instance = assigns(:wiki2)
 
       expect(wiki2_instance.id).to eq my_wiki2.id
       expect(wiki2_instance.title).to eq my_wiki2.title
       expect(wiki2_instance.body).to eq my_wiki2.body
     end
   end
   
   describe "PUT update" do
     it "updates post with expected attributes" do
       new_title = "Wiki Page"
       new_body = "This is a Wiki Page"
 
       put :update, id: my_wiki2.id, wiki2: {title: new_title, body: new_body, private: true}
 
       updated_wiki2 = assigns(:wiki2)
       expect(updated_wiki2.id).to eq my_wiki2.id
       expect(updated_wiki2.title).to eq new_title
       expect(updated_wiki2.body).to eq new_body
       expect(updated_wiki2.private).to eq(true)
     end
 
     it "redirects to the updated wiki" do
       new_title = "Wiki Page"
       new_body = "This is a Wiki Page"
 
       put :update, id: my_wiki2.id, wiki2: {title: new_title, body: new_body}
       expect(response).to redirect_to my_wiki2
     end
   end
   
    describe "DELETE destroy" do
     it "deletes the wiki" do
       delete :destroy, {id: my_wiki2.id}
       count = Wiki2.where({id: my_wiki2.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to wikis index" do
       delete :destroy, {id: my_wiki2.id}
       expect(response).to redirect_to wiki2s_path
     end
    end
end