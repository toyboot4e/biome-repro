# Biome repro

## Summary

Since Biome 2.5.15, Biome panics when the project contains a symlink to a file outside the project and `vcs.useIgnoreFile` is true.

## File structure

Here's the relevant file contents:

```
.
├── project/               (File content)
│   ├── .gitignore    ...  dist
│   ├── biome.json    ...  { "vcs": { "enabled": true, "clientKind": "git", "useIgnoreFile": true } }
│   └── package.json  ...  symlink to ../shared/package.json
└── shared/
    └── package.json  ...  {}
```

## Reproduction

If we run `npx @biomejs/biome@<version> lint` from `./project`, it shows as follows:

```console
$ ./run.sh
== @biomejs/biome@2.5.14
Checked 2 files in 696µs. No fixes applied.
== @biomejs/biome@2.5.15
Biome encountered an unexpected error

This is a bug in Biome, not an error in your code, and we would appreciate it if you could report it to https://github.com/biomejs/biome/issues/ along with the following information to help us fixing the issue.

When opening the issue, please provide a minimal reproduction, or identify and share the file/code that triggers it. Without a way to reproduce the error, the error can't be fixed:

Source Location: /Users/runner/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/ignore-0.4.25/src/gitignore.rs:232:9
Thread Name: biome::workspace_worker_0
Message: path is expected to be under the root
Stack Trace:
   0: __mh_execute_header
   1: __mh_execute_header
   2: __mh_execute_header
   3: __mh_execute_header
   4: __mh_execute_header
   5: __mh_execute_header
   6: __mh_execute_header
   7: __mh_execute_header
   8: __mh_execute_header
   9: __mh_execute_header
  10: __mh_execute_header
  11: __mh_execute_header
  12: __mh_execute_header
  13: __mh_execute_header
  14: __mh_execute_header
  15: __mh_execute_header
  16: __mh_execute_header
  17: __mh_execute_header
  18: __mh_execute_header
  19: __mh_execute_header
  20: __mh_execute_header
  21: __mh_execute_header
  22: __mh_execute_header
  23: __mh_execute_header
  24: __pthread_exit


== @biomejs/biome@2.6.4
Biome encountered an unexpected error

This is a bug in Biome, not an error in your code, and we would appreciate it if you could report it to https://github.com/biomejs/biome/issues/ along with the following information to help us fixing the issue.

When opening the issue, please provide a minimal reproduction, or identify and share the file/code that triggers it. Without a way to reproduce the error, the error can't be fixed:

Source Location: /Users/runner/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/ignore-0.4.25/src/gitignore.rs:232:9
Thread Name: biome::workspace_worker_0
Message: path is expected to be under the root
Stack Trace:
   0: __mh_execute_header
   1: __mh_execute_header
   2: __mh_execute_header
   3: __mh_execute_header
   4: __mh_execute_header
   5: __mh_execute_header
   6: __mh_execute_header
   7: __mh_execute_header
   8: __mh_execute_header
   9: __mh_execute_header
  10: __mh_execute_header
  11: __mh_execute_header
  12: __mh_execute_header
  13: __mh_execute_header
  14: __mh_execute_header
  15: __mh_execute_header
  16: __mh_execute_header
  17: __mh_execute_header
  18: __mh_execute_header
  19: __mh_execute_header
  20: __mh_execute_header
  21: __mh_execute_header
  22: __mh_execute_header
  23: __mh_execute_header
  24: __pthread_exit
```
