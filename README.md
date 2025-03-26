# phoenixthrush homebrew-tools

## How do I install these formulae?

`brew install phoenixthrush/homebrew-tools/<formula>`

Or `brew tap phoenixthrush/homebrew-tools` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```shell
tap "phoenixthrush/homebrew-tools"
brew "<formula>"
```

## Available Packages

- `filius`: Filius is a network simulator for educational purposes.

    ```shell
    brew install --HEAD --formula filius
    ```

- `tcc`: Tiny C Compiler for x86, x86-64, and ARM.

    ```shell
    # tcc already exists in homebrew-core
    brew install --HEAD --formula phoenixthrush/homebrew-tools/tcc
    ```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
