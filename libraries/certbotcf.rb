#
# Chef Documentation
# https://docs.chef.io/libraries.html
#

#
# This module name was auto-generated from the cookbook name. This name is a
# single word that starts with a capital letter and then continues to use
# camel-casing throughout the remainder of the name.
#
module CertbotCF
  module Helpers
    def certbot_cf
      node['certbot_cf']
    end

    def certbot_dry_run?
      certbot_cf['dry_run']
    end

    def certbot_agree_to_tos?
      certbot_cf['agree_to_tos']
    end

    def certbot_email
      certbot_cf['email']
    end

    def certbot_server
      certbot_cf['acme'][certbot_cf['server']]
    end

    def cf
      certbot_cf['cloudflare']
    end

    %w(api_key credentials_path
       dns_propagation_seconds).each do |method|
      define_method :"cf_#{method}" do
        cf[method]
      end
    end

    def cf_email
      cf['email'] || certbot_cf['email']
    end
  end
end

#
# The module you have defined may be extended within the recipe to grant the
# recipe the helper methods you define.
#
# Within your recipe you would write:
#
#     extend CertbotCF::Helpers
#
#     my_helper_method
#
# You may also add this to a single resource within a recipe:
#
#     template '/etc/app.conf' do
#       extend CertbotCF::Helpers
#       variables specific_key: my_helper_method
#     end
#
