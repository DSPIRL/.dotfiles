##### EDITOR #####
$env.VISUAL = "/usr/bin/nvim"


##### MANPAGER #####
$env.MANPAGER = "nvim +Man!"


##### PATH + VARS #####
$env.PATH = ($env.PATH | prepend ~/.local/bin)


##### C# PATH #####
if ("~/.dotnet" | path exists) {
    $env.DOTNET_ROOT = "/usr/local/share/dotnet"
    load-env {
        "PATH": ($env.PATH | append $env.DOTNET_ROOT | append "~/.dotnet/tools")
    }
}

if ("~/.cargo" | path exists) {
    $env.CARGO_HOME = "~/.cargo/bin"
    load-env {
        "PATH": ($env.PATH | prepend $env.CARGO_HOME)
    }
}
