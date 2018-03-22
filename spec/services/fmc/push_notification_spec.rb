require 'rails_helper'

RSpec.describe FMC::PushNotification do
  subject { FMC::PushNotification.perform(registration_ids, title, body) }

  let(:auth_key) { Faker::Crypto.md5 }

  let(:registration_ids) { Faker::Lorem.word }
  let(:title) { Faker::Lorem.word }
  let(:body) { Faker::Lorem.word }

  let(:message) do
    {
      registration_ids: [registration_ids],
      notification: {
        title: title,
        body: body
      }
    }
  end

  let(:ret) do
    {
      multicast_id: Faker::Number.number(10),
      success:Faker::Number.number(1),
      failure: Faker::Number.number(1),
      canonical_ids: Faker::Number.number(1),
      results:[]
    }
  end

  let(:headers) do
    {
      'Content-Type' => 'application/json',
      'Authorization' => auth_key
    }
  end

  describe 'send message' do
    before do
      ENV['firebase_cloud_messaging_key'] = auth_key
      stub_request(:post, 'https://fcm.googleapis.com/fcm/send').
        with(body: message, headers: headers).
        to_return(body: ret.to_json)
    end

    it 'send message and return response' do
      expect(subject.success?).to be_truthy
      expect(subject.result.multicast_id).to eq(ret[:multicast_id])
      expect(subject.result.success).to eq(ret[:success])
      expect(subject.result.failure).to eq(ret[:failure])
      expect(subject.result.canonical_ids).to eq(ret[:canonical_ids])
      expect(subject.result.results).to eq(ret[:results])
    end
  end
end
