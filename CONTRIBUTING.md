# Contributing to dl-distro

Thank you for contributing to dl-distro. Your support helps make this project
better.

## Guidelines for Contributions

### Code Style

- Use tabs for indentation and spaces for alignment.
- Follow [ShellCheck] and [Shellharden] recommendations for code quality.

### Adding a New Distribution

1. Add the distribution's data to [`data.json`].
2. Update the `supported_distros` array in [`dl-distro`] and implement the
   download function.
3. Update the [Supported Distributions] section in the [`README.md`] and update
   the [man page].
4. Update shell [completion files].

### Testing

- Use `-s, --spider` to verify URLs without downloading files.
- Test at least one full download and verification of an image.
- Reach out for access to an internal script for batch URL testing.

### Pull Requests

- Submit PRs to the `master` branch on [Codeberg].
- Include a descriptive title and details about your changes.

### Distribution Updates

- Distribution updates are tracked via RSS feeds. Reach out for a list of RSS
  sources used by dl-distro.

### Contact

- Open an issue on the [repository].
- Email [bashuser30@mailbox.org] (GPG: C6312EC0).

<!-- links -->
[ShellCheck]: https://github.com/koalaman/shellcheck
[Shellharden]: https://github.com/anordal/shellharden
[`data.json`]: data.json
[`dl-distro`]: dl-distro
[Supported Distributions]: README.md#supported-distributions
[`README.md`]: README.md
[man page]: man/dl-distro.1
[completion files]: completions/
[Codeberg]: https://codeberg.org/bashuser30/dl-distro
[repository]: https://codeberg.org/bashuser30/dl-distro/issues
[bashuser30@mailbox.org]: mailto:bashuser30@mailbox.org
