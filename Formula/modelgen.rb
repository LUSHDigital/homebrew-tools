class Modelgen < Formula
  desc "Generate models from reading your database"
  homepage "https://github.com/LUSHDigital/modelgen"
  url "https://github.com/LUSHDigital/modelgen/archive/1.3.7.tar.gz"
  sha256 "aa866f12d4f1d3b0a4a826d33d741a460f6ace949b452e9836ee3ec5a0d2238e"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/LUSHDigital/modelgen").install buildpath.children
    cd "src/github.com/LUSHDigital/modelgen" do
      system "go", "build", "-ldflags", "-X main.version=#{version}"
      bin.install "modelgen"
    end
  end

  test do
    system "#{bin}/modelgen", "version"
  end
end
