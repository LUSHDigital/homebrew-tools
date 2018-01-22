class Litmus < Formula
  desc " Run automated HTTP requests from the command-line"
  homepage "https://github.com/LUSHDigital/litmus"
  url "https://github.com/LUSHDigital/litmus/archive/0.1.0.tar.gz"
  sha256 "df49ab151584fc180326952554a2de196c226c03a329c7fdc68b18088f690eb7"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/LUSHDigital/litmus").install buildpath.children
    cd "src/github.com/LUSHDigital/litmus" do
      system "go", "build"
      bin.install "litmus"
    end
  end
  test do
    system.do "#{bin}/litmus", "-h"
  end
end
