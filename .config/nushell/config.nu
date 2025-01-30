$env.config = {
    keybindings: [
        {
            name: Tmux_Sessionizer
            modifier: CONTROL
            keycode: Char_f
            mode: emacs
            event: [
                {
                    send: executehostcommand
                    cmd: "source ~/.local/scripts/tmux-sessionizer.nu"
                }
            ]
        }
    ]
}

$env.EDITOR = 'nvim'
$env.PATH = ($env.PATH | split row (char esep) | append "/home/charan/.deno/bin" | append "/home/charan/.local/share/pnpm" | append "/home/charan/.asdf/shims" | append "/opt/asdf-vm/bin" | append "/home/charan/.cargo/bin" | append "/home/charan/.local/bin" | append "/home/charan/.local/scripts" | append "/usr/local/go/bin" | append "/usr/local/jdk-23/bin" | append "/opt/gradle/gradle-8.10.1/bin" | append "/usr/local/zig" | append "/home/charan/.local/bin/ghostty" | append "/home/charan/Personal/go/bin")
alias vim = nvim
source ~/.oh-my-posh.nu
