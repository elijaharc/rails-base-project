require 'rails_helper'

RSpec.describe Broker, type: :model do
  it { expect(described_class.new).to validate_presence_of :email }
  it { expect(described_class.new).to validate_presence_of :broker_name }
  it { expect(described_class.new).to validate_presence_of :admin_id }
  it { expect(described_class.new).to validate_presence_of :account_type }

  describe "#methods" do
    describe "stock_already_added?" do
      context "when stock searched has not been added before" do
        let!(:admin) { FactoryBot.create(:admin) }
        let!(:broker) { FactoryBot.create(:broker) }
        let!(:stock) { FactoryBot.create(:stock) }
        it "should return 'false'" do
          expect(broker.stock_already_added?(stock.ticker, broker.id)).to be_falsy
        end
      end

      context "when stock searched has been added before" do
        let!(:admin) { FactoryBot.create(:admin) }
        let!(:broker) { FactoryBot.create(:broker) }
        let!(:stock) { FactoryBot.create(:stock) }
        it "should return 'true'" do
          broker.stocks << stock
          expect(broker.stock_already_added?(stock.ticker, broker.id)).to be_truthy
        end
      end

    describe "can_add_stock?" do
      context "when stock can be added by broker" do
        let!(:admin) { FactoryBot.create(:admin) }
        let!(:broker) { FactoryBot.create(:broker) }
        let!(:stock) { FactoryBot.create(:stock) }
        it "should return 'false'" do
          expect(broker.can_add_stock?(stock.ticker, broker.id)).to be_falsy
        end
      end
    end
    end
  end
end
