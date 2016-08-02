require 'rails_helper'

RSpec.describe User, type: :model do
 
 let(:user) { User.create!(name: "Blocipedia User", email: "user@blocipedia.com", password: "password") }
   
 it { is_expected.to have_many(:wikis) }
 
 describe "attributes" do
     it "should have name and email attributes" do
       expect(user).to have_attributes(name: "Blocipedia User", email: "user@blocipedia.com")
     end
 end
 
end
