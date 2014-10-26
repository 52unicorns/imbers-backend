require 'rails_helper'

describe Message do
  describe 'message limit' do
    it 'cannote be saved if the given match has reached the limit' do
      match = create :match
      create_list :message, 50, match: match

      message = build :message, match: match
      message.save
      expect(message).to_not be_persisted
    end
  end

  describe '.since' do
    it 'returns all messages since given date' do
      message1 = create :message
      message2 = create :message

      expect(Message.since(message1.created_at).first).to eq message2
    end

    it 'acts as noop' do
      message = create :message
      expect(Message.since(nil).first).to eq message
    end
  end
end
