FactoryGirl.define do
  factory :product do
    association :category
    association :company
    title "MyString"
    description "MyText"
    photo "MyString"
    main_options ""
    additional_info ""
  end
end
