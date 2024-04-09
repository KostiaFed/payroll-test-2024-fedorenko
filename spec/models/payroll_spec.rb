require "rails_helper"

RSpec.describe Payroll, type: :model do
  describe "generate_payroll" do
    before do
      allow(Date).to receive(:today).and_return(Date.new(2024, 4, 9))
    end

    context "When no payrolls exist yet" do
      it "Creates a new payroll with the starts_at attribute set to 2 months ago" do
        created_payroll = Payroll.generate_payroll
        expect(created_payroll.starts_at).to eq(Date.new(2024, 2, 20))
        expect(created_payroll.ends_at).to eq(Date.new(2024, 3, 4))
      end
    end
  end
end
