##### DOTNET #####
let external_completer = { |spans|
    {
        dotnet: { ||
            dotnet complete (
                $spans | skip 1 | str join " "
            ) | lines
        }
    } | get $spans.0 | each { || do $in }
}


##### ZOXIDE #####
zoxide init nushell | save -f ~/.zoxide.nu


##### CARAPACE #####
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu


##### NUSHELL ENV #####
$env.config = {
    filesize: {
        unit: "metric"
    },
    table: {
        mode: "default",
        index_mode: "always",
        show_empty: true,
        padding: {
            left: 1,
            right: 1
        },
        trim: {
            methodology: "wrapping",
            wrapping_try_keep_words: true
        },
        header_on_separator: false,
        abbreviated_row_count: null,
        footer_inheritance: false
    },
    ls: {
        use_ls_colors: true,
        clickable_links: true
    },
    footer_mode: 25,
    float_precision: 2,
    recursion_limit: 50,
    use_ansi_coloring: true,
    completions: {
        sort: "smart",
        case_sensitive: false,
        quick: true,
        partial: true,
        algorithm: "prefix",
        external: {
            enable: true,
            max_results: 100,
            completer: null
        },
        use_ls_colors: true
    },
    edit_mode: "emacs",
    history: {
        max_size: 100000,
        sync_on_enter: true,
        file_format: "plaintext",
        isolation: false
    },
    keybindings: [],
    menus: [],
    hooks: {
        pre_prompt: [],
        pre_execution: [],
        env_change: {},
        display_output: "if (term size).columns >= 100 { table -e } else { table }",
        command_not_found: null
    },
    rm: {
        always_trash: false
    },
    shell_integration: {
        osc2: true,
        osc7: true,
        osc8: true,
        osc9_9: false,
        osc133: true,
        osc633: true,
        reset_application_mode: true
    },
    buffer_editor: "/usr/bin/nvim",
    show_banner: false,
    bracketed_paste: true,
    render_right_prompt_on_last_line: false,
    explore: {},
    cursor_shape: {
        emacs: "inherit",
        vi_insert: "inherit",
        vi_normal: "inherit"
    },
    datetime_format: {
        normal: null,
        table: null
    },
    error_style: "fancy",
    display_errors: {
        exit_code: false,
        termination_signal: true
    },
    use_kitty_protocol: false,
    highlight_resolved_externals: false,
    plugins: {},
    plugin_gc: {
        default: {
            enabled: true,
            stop_after: 10sec
        },
        plugins: {}
    }
}


