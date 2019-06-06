require 'rails_helper'

RSpec.describe Contact, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    it { should have_many(:tasks) }

    it { should have_many(:jobs) }

    it { should have_many(:activities) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
