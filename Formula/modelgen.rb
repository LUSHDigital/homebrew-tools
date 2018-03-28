class Modelgen < Formula
  desc "Generate models from reading your database"
  homepage "https://github.com/LUSHDigital/modelgen"
  url "https://github.com/LUSHDigital/modelgen/archive/1.2.0.tar.gz"
  sha256 "6e304289c36951a21eb6890e4bdf63150bdf2f5c9c418442ec54b8f24174e4bf"

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
