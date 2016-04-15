require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  before(:each) do
    @email_address = assign(:email_address, EmailAddress.create!(
      :email => "MyString",
      :contact_id => 1,
      :contact_type => 'Person'
    ))
  end

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(@email_address), "post" do

      assert_select "input#email_address_email[name=?]", "email_address[email]"

      assert_select "input#email_address_contact_id[name=?]", "email_address[contact_id]"

      assert_select "input#email_address_contact_type[name=?]", "email_address[contact_type]"
    end
  end
end
