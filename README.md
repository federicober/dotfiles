# federicober's dotfiles

HaaS (linux Home as a Service) files using [`chezmoi`](https://www.chezmoi.io/)

## Usage

1. Install [chezmoi](https://www.chezmoi.io/install/)
2. `chezmoi init`
3. `chezmoi apply`

## Notes on external files

The following objects are installed from external files.
For more info, check the `.chezmoiexternal.toml` file.

### Additional external files

Additional external files can be added by adding the following section in your `~/.config/chezmoi/chezmoi.toml`:

```toml
[[data.external]]
directory=".shrc.d/extra"
remote="git@github.com/federicober/more_dot_files.git"
```

Note that you can add this section several times.
