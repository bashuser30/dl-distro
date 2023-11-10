## Contributing

Thank you for considering contributing to `dl-distro`. This document has some contributing guidelines
and information about how I routinely test the script to ensure all combinations lead to valid URLs.

### Guidelines

- **Code Style/Flow**:
Please ensure your code adheres to the existing style and flow of the project.
This includes using [tabs for indentation and spaces for alignment](https://vim.fandom.com/wiki/Indent_with_tabs,_align_with_spaces) to ensure consistency and maintainability across various editors.

- **Simplicity**:
When adding support for new distributions, additions, or features, try to keep it simple.
Ideally, additions should mainly involve:

  - Adding data to or updating `data.json`.
  - Creating a download function for a distribution.
  - Adding new options to existing download functions.
  - Adding a new entry to or updating [Supported Distributions](README.md#supported-distributions).
  - Adding a new entry to the usage in the script and [README.md](README.md#usage).

- **Open an Issue First**:
Before you start writing code, it's a good idea to open an issue to discuss your intended changes.
This way, we can avoid any unnecessary work or potential conflicts with planned features.

- **Pull Requests**:
Once you're ready to share your changes, please open a pull request.
Ensure your PR has a descriptive title and explains the purpose and context of the change.
For a typical example of what a pull request should include, please see this [commit](https://codeberg.org/bashuser30/dl-distro/commit/04d3a8e96c49dacc9dd2f2e9f42db15b80c02241).

## Testing

### The Spider Option

For testing, the `-s, --spider` option is highly useful as it allows you to check URLs
without needing to download files.
This method is effective for verifying if the combinations lead to a successful download link.
However, errors might still occur after the actual download process.
Therefore, I strongly recommend testing **AT LEAST** one fully downloaded and verified image
before submitting a pull request for a new distribution or addition.
If you are absolutely certain that the verification will succeed, you may opt to skip this step,
but please ensure you are 100% confident in its accuracy.

### Expect Script

This script has many combinations, making manual testing impractical.
I've developed an `expect` script for `dl-distro` that checks every possible combination
using the `-s, --spider` option.
This is incredibly helpful for maintaining the project, as it enables me to routinely ensure
all URLs are valid, and to identify inconsistencies, particularly during significant updates
to the JSON file when a new distribution version is released.
If you're interested in this script, please let me know.

For standard version updates, I monitor various distributions through RSS feeds of their
blogs and announcements using the [Newsboat RSS feed reader](https://newsboat.org).
If you would like the list of URLs I use specifically for `dl-distro`, feel free to ask.
