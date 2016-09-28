# If defined, ALAVETELI_TEST_THEME will be loaded in config/initializers/theme_loader
ALAVETELI_TEST_THEME = 'askyourgovug-theme'
require File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','..', '..', 'spec','spec_helper'))

describe HelpController do

  context "when overriden by the theme" do

    it 'renders the form when no params are supplied' do
      post :contact
      expect(response).to be_success
      expect(response).to render_template('help/contact')
    end

    it 'does not accept a form without a comment param' do
      post :contact, { :contact => {
                         :name => 'Vinny Vanilli',
                         :email => 'vinny@localhost',
                         :subject => 'Why do I have such an ace name?',
                         :message => "You really should know!!!\n\nVinny" },
                       :submitted_contact_form => 1 }
      expect(response).to redirect_to(frontpage_path)
    end

  end

end
