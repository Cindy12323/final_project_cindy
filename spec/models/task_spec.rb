require 'rails_helper'

RSpec.describe Task, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:contact) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end