# Contributing to dl-distro

Thank you for considering contributing to dl-distro. Your contributions help
improve the project for everyone.

## Code Style and Flow

Please adhere to the existing style and flow of the project:

- **Indentation**:
  Use tabs for indentation and spaces for alignment.

- **Coding Guidelines**:
  Follow [ShellCheck] and [Shellharden] recommendations to ensure code quality
  and consistency.

## Adding Support for a New Distribution

To add support for a new distribution, please follow these steps:

1. **Add Distribution Data**:
  Include the necessary data in `data.json` for the new distribution.

2. **Update the Script**:
  Add the distribution to the `supported_distros` array in `dl-distro`, and
  implement and test the download function for the new distribution.

3. **Update Documentation**:
  Modify `README.md` to increase the image and distribution counts and add the
  new distribution to the list of supported distributions. Update the man page
  to include the new distribution.

4. **Update Completion Files**:
  Add the new distribution to any shell completion scripts.

## Testing Your Changes

Before submitting your changes, please thoroughly test them:

- **URL Testing**:
  Use the `-s, --spider` option to test URLs without downloading files.

- **Download and Verification**:
  Test at least one full download and verification of an image to ensure
  everything works as expected.

A Bash script is available to generate and verify URLs from the JSON file using
`curl`. It's not public to prevent abuse, but if you're interested in using it
for testing, please reach out.

## Submitting Pull Requests

Please submit your pull requests on [Codeberg], directing them to the `dev`
branch. Ensure your PR has a descriptive title and a detailed description of the
changes.

## Monitoring Distribution Updates

Distribution version updates are monitored through RSS feeds. For a list of
specific URLs used by dl-distro, please reach out.

## Contact and Support

If you have any questions or need assistance, feel free to:

- **Open an Issue**:
  Submit an issue on the [repository].

- **Email**:
  Contact at [bashuser30@mailbox.org] (GPG: C6312EC0).

---

**Thank you for contributing to dl-distro!**

<!-- links -->
[ShellCheck]: https://github.com/koalaman/shellcheck
[Shellharden]: https://github.com/anordal/shellharden
[Codeberg]: https://codeberg.org/bashuser30/dl-distro
[repository]: https://codeberg.org/bashuser30/dl-distro/issues
[bashuser30@mailbox.org]: mailto:bashuser30@mailbox.org
