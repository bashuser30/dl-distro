## Contributing

Thank you for considering contributing to `dl-distro`. Below are some guidelines. The project isn't too complex so nothing strict.

### Guidelines

- **Code Style/Flow**: Please ensure your code adheres to the existing style and flow of the project. This includes using [tabs for indentation and spaces for alignment](https://vim.fandom.com/wiki/Indent_with_tabs,_align_with_spaces) to ensure consistency and maintainability across various editors.

- **Simplicity**: When adding support for new distributions, additions, or features, try to keep it simple. Ideally, additions should mainly involve:

  - Adding data to or updating `data.json`.
  - Creating a download function for a distribution.
  - Adding new options to existing download functions.
  - Adding a new entry to or updating [Supported Distributions](README.md#supported-distributions).
  - Adding a new entry to the usage in the script and [README.md](README.md#usage).

- **Open an Issue First**: Before you start writing code, it's a good idea to open an issue to discuss your intended changes. This way, we can avoid any unnecessary work or potential conflicts with planned features.

- **Pull Requests**: Once you're ready to share your changes, please open a pull request. Ensure your PR has a descriptive title and explains the purpose and context of the change. For a typical example of what a pull request should include, please see this [commit comparison](https://codeberg.org/bashuser30/dl-distro/compare/34dbaa14e8...64e55c4b7d).

### Testing

Using `wget_spider()`, the `-s, --spider` option, is great for testing as you don't need to download files. It helps check if the combinations lead to a successful download. Errors can still arise after downloading though. Please test **AT LEAST** `1` fully downloaded and verified image before submitting a pull request of a new distribution or addition. If you are certain the verification will succeed you may skip this test but please be 100%.

### Expect Script

This script has a lot of combinations, to test them all manually would be crazy. I have an `expect` script made for `dl-distro`. This Expect script will check every single combination possible with the `-s, --spider` option. This script helps a ton with potential filename changes due to intermediary patched images that aren't announced or any other reason for a filename change.

If you would like this script please ask me.

As for normal announced versions, I have a list of RSS feeds for various distribution's blogs and feeds.
