require File.expand_path('../../test_helper', __FILE__)

module KickstarterStripe

  class CertificateBlacklistTest < Test::Unit::TestCase
    should "not trust revoked certificates" do
      assert_raises(KickstarterStripe::APIConnectionError) {
        KickstarterStripe::CertificateBlacklist.check_ssl_cert("https://revoked.stripe.com:444",
                                                    KickstarterStripe::DEFAULT_CA_BUNDLE_PATH)
      }
    end

    should "trust api.stripe.com" do
      assert_true KickstarterStripe::CertificateBlacklist.check_ssl_cert("https://api.stripe.com",
                                                              KickstarterStripe::DEFAULT_CA_BUNDLE_PATH)
    end
  end
end
