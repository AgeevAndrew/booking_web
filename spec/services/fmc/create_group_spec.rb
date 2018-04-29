require 'rails_helper'

RSpec.describe FMC::CreateGroup do
  subject { FMC::CreateGroup.perform(group_name) }

  let(:group_name) { Faker::Lorem.word }

  let(:auth_key) { Faker::Crypto.md5 }
  let(:sender_id) { Faker::Number.number(10) }

  let(:notification_key) { Faker::Crypto.md5 }

  let(:message) do
    {
      operation: 'create',
      notification_key_name: group_name,
      registration_ids: []
    }
  end

  let(:ret) do
    {
      notification_key: notification_key
    }
  end

  let(:headers) do
    {
      'Content-Type' => 'application/json',
      'Authorization' => auth_key,
      'project_id' => sender_id
    }
  end

  describe 'create group' do
    before do
      ENV['firebase_cloud_messaging_key'] = auth_key
      ENV['firebase_cloud_messaging_sender_id'] = sender_id
      stub_request(:post, 'https://android.googleapis.com/gcm/notification').
        with(body: message, headers: headers).
        to_return(body: ret.to_json)
    end

    it 'send message and return response' do
      expect(subject.success?).to be_truthy
      expect(subject.result.notification_key).to eq(ret[:notification_key])
    end
  end
end
