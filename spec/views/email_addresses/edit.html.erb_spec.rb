require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  let(:person) { Person.create(first_name: 'Alice', last_name: 'Bob') }
  let(:email_address) { EmailAddress.create!(contact_id: person.id, contact_type: 'Person', email: 'wladi@eu') }
  before(:each) do
    assign(:email_address, email_address)
  end

  it "shows the contact's name in the title" do
    render
    assert_select("h1", text: "Edit Email Address for #{email_address.contact.first_name} #{email_address.contact.last_name}")
  end

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(email_address), "post" do

      assert_select "input#email_address_email[name=?]", "email_address[email]"

      assert_select "input#email_address_contact_id[name=?]", "email_address[contact_id]"
    end
  end
end
