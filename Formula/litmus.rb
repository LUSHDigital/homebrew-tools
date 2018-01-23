class Litmus < Formula
  desc "Run automated HTTP requests from the command-line"
  homepage "https://github.com/LUSHDigital/litmus"
  url "https://github.com/LUSHDigital/litmus/archive/0.3.0.tar.gz"
  sha256 "03039ef64fc6b301196cf9e0c56371d81b8206353f583e07328f6767bb54b18b"

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
