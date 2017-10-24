# frozen_string_literal: true

require 'rails_helper'

module Accounts::Addresses::Forms
  RSpec.describe CreateForm do
    let(:model) { Address.new }

    let(:params) do
      {
        title: title,
        city: city,
        street: street,
        house: house,
        office: office,
        floor: floor,
        entrance: entrance,
        code: code,
      }
    end

    # default_params
    let(:title) { Faker::Space.galaxy }
    let(:city) { Faker::Address.city }
    let(:street) { Faker::Address.street_name }
    let(:house) { Faker::Address.building_number }
    let(:office) { Faker::Number.number(2) }
    let(:floor) { Faker::Number.number(1) }
    let(:entrance) { Faker::Number.between(1, 4) }
    let(:code) { office }

    let(:form) { described_class.new(model) }
    let(:form_validate) { form.validate(params) }

    describe '#validate' do
      before { form_validate }
      subject do
        form.errors.messages
      end

      %i[title city street house].each do |field|
        context field.to_s do
          let(field) { nil }
          it { expect(subject[field]).to include "can't be blank" }
        end
      end
    end
  end
end
