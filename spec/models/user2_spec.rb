require 'rails_helper'

RSpec.describe User2, type: :model do
  let(:user2) { User2.create!(name: "Blocipedia User", email: "user@blocipedia.com", password: "password") }
   
 it { is_expected.to have_many(:wiki2s) }
 
 describe "attributes" do
     it "should have name and email attributes" do
       expect(user2).to have_attributes(name: "Blocipedia User", email: "user@blocipedia.com")
     end
end
end
