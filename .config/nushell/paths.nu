if ((sys host | get name) == "Linux") {
##### LINUX #####
    # EDITOR #
    $env.VISUAL = "/usr/bin/nvim"
    # C# PATH #
    if ("~/.dotnet" | path exists) {
        $env.DOTNET_ROOT = "/usr/local/share/dotnet"
        load-env {
            "PATH": ($env.PATH | append $env.DOTNET_ROOT | append $"($env.HOME)/.dotnet/tools")
        }
    }
} else if ((sys host | get name) == "Darwin") {
##### MACOS #####
    $env.VISUAL = "/opt/homebrew/bin/nvim"
    $env.config.buffer_editor = "/opt/homebrew/bin/nvim"

}


##### GLOBAL #####
# MANPAGER #
$env.MANPAGER = "nvim +Man!"

# PATH + VARS #
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/bin")

# RUST PATH #
if ("~/.cargo" | path exists) {
    $env.CARGO_HOME = $"($env.HOME)/.cargo"
    load-env {
        "PATH": ($env.PATH | prepend $env.CARGO_HOME)
    }
}
