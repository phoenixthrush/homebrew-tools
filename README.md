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

- `tcc`: Tiny C Compiler for x86, x86-64, and ARM.

    ```shell
    # tcc already exists in homebrew-core
    brew install --HEAD --formula phoenixthrush/homebrew-tools/tcc
    ```

- `filius`: Filius is a network simulator for educational purposes.

    ```shell
    brew install --HEAD --formula filius
    ```

- `johnny`: Johnny is a simulator of a simple (virtual) von-Neumann Computer.

    ```shell
    brew install --HEAD --formula johnny
    ```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
