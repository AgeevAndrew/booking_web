require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :addresses => ""
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input[name=?]", "account[name]"

      assert_select "input[name=?]", "account[phone]"

      assert_select "input[name=?]", "account[email]"

      assert_select "input[name=?]", "account[addresses]"
    end
  end
end
