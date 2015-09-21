require 'spec_helper'

describe ProspectImport do
  subject { ProspectImport.new(Rails.root.join('spec', 'fixtures', 'prospects.csv')) }

  describe "#process!" do
    it "should create a Prospect" do
      expect { subject.process! }.to change { Prospect.count }.by 22
    end
  end
end
