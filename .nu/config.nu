$env.config = {
    show_banner: false
    error_style: "fancy"
    buffer_editor: "nano"
    use_ansi_coloring: true

    cursor_shape: {
        emacs: line
    }

    history: {
        max_size: 1000
        sync_on_enter: true
        file_format: "plaintext"
    }

    completions: {
        case_sensitive: false
        quick: true
        algorithm: prefix
        partial: true
        external: {
            enable: true
            max_results: 100
        }
    }

    rm: {
        always_trash: true
    }

    ls: {
        use_ls_colors: true
        clickable_links: true
    }

    table: {
        mode: rounded
        index_mode: always
        show_empty: true
        padding: { left: 1, right: 1 }
        trim: {
            methodology: wrapping
            wrapping_try_keep_words: true
            truncating_suffix: "..."
        }
        header_on_separator: false
    }
}

use std/util "path add"
path add ($env.HOME | path join ".local/bin")
path add ($env.HOME | path join ".cargo/bin")

$env.PATH = ($env.PATH | uniq)

$env.LS_COLORS = (vivid generate catppuccin-mocha)

$env.CARAPACE_BRIDGES = "zsh, bash"

if ((which nushell | length) > 0) {
    mkdir ($nu.data-dir | path join "vendor/autoload")
    starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
}

source alias.nu
