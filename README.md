# statick-action

![Self Test](https://github.com/gregtkogut/statick-action/workflows/Self-Test/badge.svg?branch=action-experimentation)

This is a **GitHub Action** that runs the **[Statick](https://github.com/sscpac/statick)** static code analysis tool.

The action inputs mirror the command line arguments for the CLI version of
Statick, and much more detail about the powerful Statick configuration options is
available in the README of the above repository.

## Inputs

## `check`

Any discovered Statick issue fails the action. Default `true`.

Setting this input to `false` may be useful to allow the workflow to work through all steps while debugging.

## `config`

The Statick config file to use. Default: `config.yaml`.

## `log_level`

The statick log level to use. Default: `INFO`.

## `output_path`

Where to write Statick logs. Default: `/tmp/statick_output`.

## `package_path`

Where Statick should look for files to perform static analysis on. Default: `.`

## `profile`

The Statick profile file to use. Default: `profile.yaml`.

## `user_paths`

Where to look for user-provided Statick configuration. Default: empty string.

## Example usage

The minimal use of `statick-action`, presuming some code is present in the workflow workspace is:

```shell
uses: actions/statick-action
```

More advanced usage, including use of specific profiles, configurations,
and user-specified resources can be viewed in the
[self-test workflow](https://github.com/gregtkogut/statick-action/blob/action-experimentation/.github/workflows/self-test.yml)
in this repository.
