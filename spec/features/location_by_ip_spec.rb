require 'rails_helper'

describe 'As a user' do
  context 'When I visit http://localhost:3000/locationByIp?ip= followed by an ip address' do
    it 'I can see location information about the given ip' do
      visit('http://localhost:3000/locationByIp?ip=76.25.168.96')

      expect(page).to have_content("'ID': 'US'")
    end
  end
end
