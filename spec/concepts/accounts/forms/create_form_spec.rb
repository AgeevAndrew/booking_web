# frozen_string_literal: true

require 'rails_helper'

module Accounts::Forms
  RSpec.describe CreateForm do
    let(:model) { Account.new }

    let(:params) do
      {
        name: name,
        phone: phone,
        email: email,
        addresses: [{
          title: title,
          city: city,
          street: street,
          house: house,
          office: office,
          floor: floor,
          code: code,
        }],
      }
    end

    # default_params
    let(:name) { Faker::Name.name_with_middle }
    let(:phone) { Faker::PhoneNumber.phone_number }
    let(:email) { Faker::Internet.email }
    let(:title) { Faker::Lorem.word }
    let(:city) { Faker::Address.city }
    let(:street) { Faker::Address.street_name }
    let(:house) { Faker::Address.building_number }
    let(:office) { Faker::Number.number(2) }
    let(:floor) { Faker::Number.number(1) }
    let(:code) { office }

    let(:form) { described_class.new(model) }
    let(:form_validate) { form.validate(params) }

    describe '#validate' do
      before { form_validate }
      subject do
        form.errors.messages
      end

      %i[name phone email].each do |field|
        context field.to_s do
          let(field) { nil }
          it { expect(subject[field]).to include "can't be blank" }
        end
      end

      %i[title city street house].each do |field|
        context field.to_s do
          let(field) { nil }
          it { expect(subject[:"addresses.#{field}"]).to include "can't be blank" }
        end
      end

      context 'phone pattern' do
        context 'invalid' do
          let(:phone) { Faker::PhoneNumber.cell_phone }

          it { expect(subject[:phone]).to include 'is invalid' }
        end

        context 'valid' do
          it { expect(subject[:phone]).not_to include 'is invalid' }
        end
      end
    end
  end
end