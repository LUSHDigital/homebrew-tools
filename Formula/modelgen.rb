class Modelgen < Formula
  desc "Generate models from reading your database"
  homepage "https://github.com/LUSHDigital/modelgen"
  url "https://github.com/LUSHDigital/modelgen/archive/1.3.3.tar.gz"
  sha256 "b2c6814fe5eba9ad8c99ec7a2bc4384d0a41fd7a8015288e5e8f5929d86a3167"

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
