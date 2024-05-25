class Idpbuilder < Formula
  desc "idpBuilder"
  homepage "https://cnoe.io"
  version "v0.1.0"

  def install
    bin.install stable.url.split("/")[-1] => "idpbuilder"
    
    chmod 0755, bin/"idpbuilder"

    bash_output = Utils.safe_popen_read(bin/"idpbuilder", "completion", "bash")
    (bash_completion/"idpbuilder").write bash_output

    zsh_output = Utils.safe_popen_read(bin/"idpbuilder", "completion", "zsh")
    (zsh_completion/"_idpbuilder").write zsh_output

    fish_output = Utils.safe_popen_read(bin/"idpbuilder", "completion", "fish")
    (fish_completion/"idpbuilder.fish").write fish_output
    
  end

  test do
    system "#{bin}/idpbuilder", "version"
  end

end
