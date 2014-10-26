require 'rails_helper'

describe Message do
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
