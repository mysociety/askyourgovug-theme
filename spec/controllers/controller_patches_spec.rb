# If defined, ALAVETELI_TEST_THEME will be loaded in config/initializers/theme_loader
ALAVETELI_TEST_THEME = 'askyourgovug-theme'
require File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','..', '..', 'spec','spec_helper'))

describe TrackController do

  it 'strips a trailing OR from a search query' do
    get :track_search_query,
        :feed => 'feed',
        :query_array => " (latest_status:waiting_response OR " \
                        "latest_status:waiting_clarification OR " \
                        "waiting_classification:true OR " \
                        "latest_status:internal_review OR " \
                        "latest_status:gone_postal OR " \
                        "latest_status:error_message OR"

    expected = " (latest_status:waiting_response OR " \
               "latest_status:waiting_clarification OR " \
               "waiting_classification:true OR " \
               "latest_status:internal_review OR " \
               "latest_status:gone_postal OR " \
               "latest_status:error_message"
    expect(assigns[:query]).to eq(expected)
  end

end

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
