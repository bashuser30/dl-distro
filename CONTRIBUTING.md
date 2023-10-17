## Contributing

Thank you for considering contributing to `dl-distro`. Here I will give guidelines for contributing and a full explanation on how the script works. This will hopefully help with any questions you have regarding logic in the script. Feel free to ask any questions via the issue tracker.

### Guidelines

Here are a few guidelines to keep in mind:

- **Code Style/Flow**: Please ensure your code adheres to the existing style and flow of the project.

- **Simplicity**: When adding support for new distributions or features, try to keep it simple. Ideally, additions should mainly involve creating a new download function and adding data to `distro_data.json`.

- **Open an Issue First**: Before you start writing code, it's a good idea to open an issue to discuss your intended changes. This way, we can avoid any unnecessary work or potential conflicts with planned features.

- **Pull Requests**: Once you're ready to share your changes, please open a pull request. Ensure your PR has a descriptive title and explains the purpose and context of the change.

### How The Script Works

The "main" function is `dl_distro()`. This handles option parsing, sets variables `"$distro"` and `"$download_path"`, searches for our JSON file in the predetermined locations, and then finally will call a download function for the specified `"$distro"`.

Next comes all the function calls contained within the `download_distro()` functions.

### Functions

---

`wget_file()`

This function will download files listed in `"$@"`.

- Usage: `wget_file "$sig_file" "$sum_file"`

---

`fetch_gpg_key()`

This function fetches the required GPG key if it is missing.

- Usage: `fetch_gpg_key`

---

`gpg_verify()`

This function verifies the `"$sig_file"` itself if called with nothing, or it will verify `"$1"`. Usually thats a `"$sum_file"`.

- Usage: `gpg_verify` or `gpg_verify "$sum_file"`

---

`checksum_verify()`

This function is our final function called in every download function. It will verify the checksums located in `"$sum_file"` using the `"$sum_algo"`.

- Usage: `checksum_verify`

---

`handle_download_path()`

This function will make a directory if the user provided a path and change to it.

- Usage: `handle_download_path`

---

`get_choice()`

This function is the powerhouse for interaction. It will present a list of options, formatted nicely, from `"$@"`. It will return the users choice with `printf`. Everything else is discarded with `>&2`.

- Usage: `selected_architecture="$(get_choice "amd64" "i386")"`

If the user selects `amd64` then `selected_architecture="amd64"`. This allows us to create a lot of different combinations, as we will use these values for `jq` keys in the next function.

---

`fetch_and_assign_values()`

This function is how we get the required data from the JSON file. It will take all the keys listed in `"$@"`, prepend `"$distro"` to each key, and create a comma separated `jq` query. Then it will read the values into an array. We will set these variables using this: `"$gpg_key"` `"$url"` `"$iso_file"` `"$sig_file"` `"$sum_file"` `"$sum_algo"`.

- Usage: `fetch_and_assign_values "gpg_key" "url" "iso_file" "sig_file" "sum_file" "sum_algo"`

These keys can have for example: `"$selected_architecture"`. This gives us a lot of combination potential.

---

`wget_spider()`

This is the last notable function. It will check the `"$iso_file"` `"$sig_file"` and `"$sum_file"` via `wget --spider`.

- Usage: `wget_spider`

**NOTE**: This function **SHOULD ALWAYS** be called before `handle_download_path()`.

---

### Download Functions
The rest of the functions are download functions. These are case statements to get the required key combinations for `fetch_and_assign_values()`. Breaking down each one would get out of control. You will have to read the functions yourself to fully grasp them if you wish.

That is pretty much all there is for now... I dont really forsee adding many new notable functions, but if it happens I'll add it above.

### Testing
Using `wget_spider()` is great for testing as you dont need to download files. It helps check if the combinations lead to a successful download. Errors can still arise after downloading though. Please test AT LEAST `1` fully downloaded and verified ISO before submitting a pull request of a new distribution/addition. If you are certain the verification will succeed you may skip this test but please be 100%.

As for keeping up with version changes and potential filename changes, I have an `expect` script made for `dl-distro`. This Expect script will check every single combination possible with `wget --spider`. If you would like this script please ask me.

Along with this Expect script I also have a bunch of RSS feeds for various distributions blogs/feeds.
