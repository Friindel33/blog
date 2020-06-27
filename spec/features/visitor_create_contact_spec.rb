# testing create contact feature
require "rails_helper"
require "support/session_helper.rb"
require "support/database_cleaner.rb"

feature "Contact creation" do
  scenario "allows acess to contacts page" do
    visit new_contacts_path

    expect(page).to have_content I18n.t('contacts.contact_us')
  end

  scenario "allows a guest to create contact" do
    visit new_contacts_path
    fill_in :contact_email, with: 'foo@bar.ru'
    fill_in :contact_message, with: 'Foo Bar Baz'

    click_button 'Send Message'
    expect(page).to have_content 'Thanks for Your message', 'We will contact You as soon as possible'
  end

end
