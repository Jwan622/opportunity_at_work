require 'rails_helper'

RSpec.feature "AdminLogins", type: :feature do
  describe("an admin can login") do
    let!(:admin) { User.create(username: 'admin', password: 'password', role: 1) }
    it "visits login" do
      visit admin_login_path
      within('.login') do
        fill_in 'admin[username]', with: admin.username
        fill_in 'admin[password]', with: admin.password
      end
      click_link_or_button('Login')

      expect(current_path).to eq(admins_dashboard_index_path)
    end
  end
end
