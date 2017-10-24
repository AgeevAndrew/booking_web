# frozen_string_literal: true

require "rails_helper"

RSpec.describe AddressesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/api/accounts/1/addresses').to route_to('addresses#create', account_id: '1', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/accounts/1/addresses/1').to route_to('addresses#update', account_id: '1', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/accounts/1/addresses/1').to route_to('addresses#update', account_id: '1', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/api/accounts/1/addresses/1').to route_to('addresses#destroy', account_id: '1', id: '1', format: :json)
    end

  end
end
