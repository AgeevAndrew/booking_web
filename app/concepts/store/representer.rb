# frozen_string_literal: true

module Store
  class Representer < ApplicationRepresenter
    collection :current_users, decorator: UserRepresenter
    collection :companies, decorator: CompanyRepresenter
    collection :categories, decorator: CategoryRepresenter
    collection :products, decorator: ProductRepresenter
    collection :addresses, decorator: AddressRepresenter
    collection :orders, decorator: OrderRepresenter
    collection :order_products, decorator: OrderProductRepresenter
    collection :accounts, decorator: AccountRepresenter
    collection :push_messages, decorator: PushMessageRepresenter
  end
end
