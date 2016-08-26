require 'rails_helper'

RSpec.describe User, type: :model do
 
 let(:user) { User.create!(name: "Blocipedia User", email: "user@blocipedia.com", password: "password") }
   
 #it { is_expected.to have_many(:wikis) }
 
 describe "associations" do
    it { should have_many(:wikis) }
    it { should have_many(:collaborations)}
    it { should have_many(:shared_wikis).through(:collaborations).source(:wiki) }
 end
 
 describe "attributes" do
     it "should have name and email attributes" do
       expect(user).to have_attributes(name: "Blocipedia User", email: "user@blocipedia.com")
     end
     
     it "responds to role" do
       expect(user).to respond_to(:role)
     end
 
     it "responds to admin?" do
       expect(user).to respond_to(:admin?)
     end
 
     it "responds to premium?" do
       expect(user).to respond_to(:premium?)
     end
     
     it "responds to standard?" do
       expect(user).to respond_to(:standard?)
     end
   end

   describe "roles" do
     it "is standard by default" do
       expect(user.role).to eq("standard")
     end
 
     context "standard user" do
       it "returns true for #standard?" do
         expect(user.standard?).to be_truthy
       end
       
       it "returns false for #premium?" do
         expect(user.premium?).to be_falsey
       end
 
       it "returns false for #admin?" do
         expect(user.admin?).to be_falsey
       end
     end
     
     context "premium user" do
       before do
         user.premium!
       end
 
       it "returns false for #standard?" do
         expect(user.standard?).to be_falsey
       end
       
       it "returns true for #premium?" do
         expect(user.premium?).to be_truthy
       end
 
       it "returns false for #admin?" do
         expect(user.admin?).to be_falsey
       end
     end
 
     context "admin user" do
       before do
         user.admin!
       end
 
       it "returns false for #standard?" do
         expect(user.standard?).to be_falsey
       end
       
       it "returns false for #premium?" do
         expect(user.premium?).to be_falsey
       end
 
       it "returns true for #admin?" do
         expect(user.admin?).to be_truthy
       end
     end
   end
   
   describe 'collaborations' do
     before do
       @user = create(:user)
       @other_user = create(:user)
       @wiki = create(:wiki, user: @other_user)
     end

     it "returns 'nil' if the user has no shared wikis" do
       expect(@user.shared_wikis).to be_empty
     end

     it "returns the shared wikis if they exist" do
       @user.shared_wikis << @wiki
       expect(@user.shared_wikis).to eq([@wiki])
     end
    end
end
