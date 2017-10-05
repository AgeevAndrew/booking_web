require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :addresses => ""
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input[name=?]", "account[name]"

      assert_select "input[name=?]", "account[phone]"

      assert_select "input[name=?]", "account[email]"

      assert_select "input[name=?]", "account[addresses]"
    end
  end
end
