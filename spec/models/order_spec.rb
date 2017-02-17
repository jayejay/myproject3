require 'rails_helper'

describe Order do

  context "Empty total" do

    it "is not valid" do

      expect(Order.new(total:nil)).not_to be_valid

    end

  end

end