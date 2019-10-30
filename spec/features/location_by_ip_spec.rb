require 'rails_helper'

describe 'As a user' do
  context 'When I visit http://localhost:3000/locationByIp?ip= followed by an ip address' do
    it 'I can see location information about the given ip' do
      visit('http://localhost:3000/locationByIp?ip=76.25.168.96')

      expect(page).to have_content('US')
      expect(page).to have_content('United States')
      expect(page).to have_content(39.729)
      expect(page).to have_content(-104.832)
      expect(page).to have_content('United States - Colorado - Aurora')

      visit('http://localhost:3000/locationByIp?ip=103.252.178.64')

      expect(page).to have_content('AU')
      expect(page).to have_content('Australia')
      expect(page).to have_content(-27.469)
      expect(page).to have_content(153.023)
      expect(page).to have_content('Australia - Queensland - Brisbane')
    end
  end
end
