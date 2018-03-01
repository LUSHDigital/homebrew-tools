class Modelgen < Formula
  desc "Generate models from reading your database"
  homepage "https://github.com/LUSHDigital/modelgen"
  url "https://github.com/LUSHDigital/modelgen/archive/1.1.1.tar.gz"
  sha256 "5e700ae9c244c185510bceec6de290c2bde2c0b8ff8d8195ae6b6d6d01ece759"

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
