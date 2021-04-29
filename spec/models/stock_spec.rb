require 'rails_helper'

RSpec.describe Stock, type: :model do
  it { expect(described_class.new).to validate_presence_of :name }
  it { expect(described_class.new).to validate_presence_of :ticker }
  it { expect(described_class.new).to validate_presence_of :last_price }
  it { expect(described_class.new).to validate_presence_of :added_by }

  describe 'new_search' do
    context 'when IEX Gem search is valid' do
      it 'creates the stock object' do
        expect(described_class.new_search('GOOG')).to be_a_kind_of Object
      end
    end

    context 'when IEX Gem search is invalid' do
      it 'returns nil' do
        expect(described_class.new_search('adsadfasdf')).to be_nil
      end
    end
  end

  describe 'check_db' do
    context 'when stock has not yet been added by broker' do
      let!(:broker) { FactoryBot.create(:broker) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'nil'" do
        expect(described_class.check_db(stock.id, broker.id)).to be_nil
      end
    end

    context 'when stock has already been added by broker' do
      let!(:broker) { FactoryBot.create(:broker) }
      let!(:stock) { FactoryBot.create(:stock) }

      it 'returns the stock object' do
        broker.stocks << stock
        expect(described_class.check_db(stock.id, broker.id)).to be_a_kind_of Object
      end
    end
  end

  describe 'stock_logo' do
    context 'when getting valid stock logo from IEX Gem' do
      it 'returns logo url' do
        expect(described_class.stock_logo('GOOG')).to match(URI::DEFAULT_PARSER.make_regexp)
      end
    end

    context 'when getting invalid stock logo from IEX Gem' do
      it 'returns nil' do
        expect(described_class.stock_logo('alsdkfjas')).to be_nil
      end
    end
  end

  describe 'stock_list' do
    context 'when requesting for top 10 most active stocks from IEX Gem' do
      it 'returns array of objects' do
        expect(described_class.stock_list).to be_an_instance_of(Array)
      end
    end
  end
end
