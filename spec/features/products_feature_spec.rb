require 'rails_helper'

feature 'products' do
  scenario 'before any products have been added' do
    visit '/'
    expect(page).to have_content 'Amazong'
    expect(page).to have_content 'Getting you a great deal'
  end

  context 'adding links from Amazon' do
    before do
      visit '/'
      click_button 'Watch new item'
      fill_in 'Url', with: 'http://www.amazon.co.uk/gp/product/B0000256XN/ref=s9_simh_gw_p15_d0_i1?pf_rd_m=A3P5ROKL5A1OLE&pf_rd_s=center-2&pf_rd_r=1MKFKHJ4EVKVPTNDSJ75&pf_rd_t=101&pf_rd_p=455344027&pf_rd_i=468294'
      fill_in 'Budget', with: 0.80
      click_button 'Watch item'
    end

    scenario 'can add Amazon link and a budget and view the budget on the homepage' do
      expect(current_path).to eq '/'
      expect(page).to have_content '0.80'
    end

    scenario 'can display Amazon item\'s title' do
      expect(current_path).to eq '/'
      expect(page).to have_content 'Big Willie Style'
    end

    scenario 'can display Amazon item\'s price' do
      expect(current_path).to eq '/'
      expect(page).to have_content '0.98'
    end

    scenario 'can add Amazon image on the homepage' do
      expect(current_path).to eq '/'
      expect(page).to have_css "img[src*='_SL160_.jpg']"
    end
  end

    context 'adding incorrect links from Amazon' do
      before do
        visit '/'
        click_button 'Watch new item'
        fill_in 'Url', with: 'http://www.amazon.co.uk/gp/prot/B0000256XN'
        fill_in 'Budget', with: 0.80
        click_button 'Watch item'
      end

      scenario 'it redirects to an error page on not receing a correct url' do
        expect(current_path).to eq '/submission'
        expect(page).to have_content 'Sorry, product not found. Submitted to our team for investigation.'
      end
    end

end