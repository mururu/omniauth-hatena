require 'spec_helper'

describe OmniAuth::Strategies::Hatena do
  subject do
    OmniAuth::Strategies::Hatena.new({})
  end

  its('options.name') { should == 'hatena' }
  its('options.client_options.request_token_url') { should == 'https://www.hatena.com/oauth/initiate' }
  its('options.client_options.access_token_url') { should == 'https://www.hatena.com/oauth/token' }
  its('options.client_options.authorize_url') { should == 'https://www.hatena.ne.jp/oauth/authorize' }
end
