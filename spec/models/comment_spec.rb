require 'rails_helper'

describe Comment do

  context "body empty" do
    it "is not valid"do
      expect(Comment.new(body: "")).not_to be_valid
    end
  end

end