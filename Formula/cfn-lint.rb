class CfnLint < Formula
  include Language::Python::Virtualenv

  desc "Validate CloudFormation yaml/json templates against the CloudFormation specification."
  homepage "https://github.com/awslabs/cfn-python-lint/"
  url "https://github.com/awslabs/cfn-python-lint/archive/v0.15.0.tar.gz"
  sha256 "53ad1177d3c85a7c20adb38cac9cd08751d7f3f1a0fd40cce790d96dfae1cb76"
  version "0.15.0"
  head "https://github.com/awslabs/cfn-python-lint.git", :branch => "master"
  bottle :unneeded

  depends_on "python"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec / "bin/pip", "install", "-v", "--no-binary", ":all:", "--ignore-installed", buildpath
    system libexec / "bin/pip", "uninstall", "-y", "cfn-lint"
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cfn-lint --help")
  end
end
