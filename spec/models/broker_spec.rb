require 'rails_helper'

RSpec.describe Broker, type: :model do
  it { expect(described_class.new).to validate_presence_of :email }
  it { expect(described_class.new).to validate_presence_of :broker_name }
  it { expect(described_class.new).to validate_presence_of :admin_id }
  it { expect(described_class.new).to validate_presence_of :account_type }

  describe 'stock_already_added?' do
    context 'when stock searched has not been added before' do
      let!(:broker) { FactoryBot.create(:broker_one) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'false'" do
        expect(broker).not_to be_stock_already_added(stock.ticker, broker.id)
      end
    end

    context 'when stock has been added before' do
      let!(:broker) { FactoryBot.create(:broker_one) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'true'" do
        broker.stocks << stock
        expect(broker).to be_stock_already_added(stock.ticker, broker.id)
      end
    end
  end

  describe 'can_add_stock?' do
    context 'when stock can be added by broker' do
      let!(:broker) { FactoryBot.create(:broker_one) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'true'" do
        expect(broker).to be_can_add_stock(stock.ticker, broker.id)
      end
    end

    context "when stock can't be added by broker" do
      let!(:broker) { FactoryBot.create(:broker_one) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'false'" do
        broker.stocks << stock
        expect(broker).not_to be_can_add_stock(stock.ticker, broker.id)
      end
    end
  end

  describe 'after_confirmation' do
    context 'when app has sent out a welcome email' do
      let!(:broker) { FactoryBot.create(:broker_one) }

      it "returns that an email has been sent to broker's email" do
        broker.after_confirmation
        expect(ActionMailer::Base.deliveries[0].to).to include(broker.email)
      end
    end
  end
end
