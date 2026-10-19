# VEX perf test repository (50K images, worst case within Aqua's size limits)

Synthetic OpenVEX `not_affected` statements for VEX performance testing. Generated from the real scan data of the
50,566 `scale-images-*` images in the perf environment.

## Contents
| | |
|---|---|
| Package files | 13,534 (`pkg/<type>/<namespace>/<name>/openvex.json`, one per package) |
| CVEs | 4,114 |
| Statements | 900,716 |
| Products (purls) | 1,317,596 |
| Largest file | about 4.2 MiB |
| Raw JSON size (decompressed) | about 259.6 MiB |
| Gzipped tarball of the JSON files | about 8.1 MiB |

Expected effect: about 34.4 million of the 88.7 million CVE-level findings across the 50K images are matched
(38.7%), if every instance matches. All statements are `not_affected` with a rotating OpenVEX justification.

## Why this size
The console rejects VEX sources whose combined decompressed size is over 300 MiB (the CC Lambda extracts all enabled
sources into a 300 MiB `/tmp`). The CVEs here are the ones that match the most findings per byte of JSON, so this is
the most suppression that fits with some margin. Keep this as the only enabled VEX source, or the combined size can
go over the limit.

## Layout
- `vex-repository.json`: repository manifest (fill the placeholders with `./set_repo.sh`)
- `index.json`: package id (purl without version) to file location
- `pkg/...`: the OpenVEX documents

## Use
1. Create a **private** empty repository on GitHub (no README, no license).
2. Fill the manifest placeholders and push:
```sh
./set_repo.sh <github-user-or-org> <repo-name>
git remote add origin git@github.com:<github-user-or-org>/<repo-name>.git
git push -u origin main
```
3. In the console: VEX Sources, add a source of type **VEX repository** (git). Use the repository URL, branch `main`,
   and a read-only access token (a fine-grained personal access token with read access to this repository only).
   Enter the token only in the console, never in this repository. Wait until the source shows synced and ready.
4. Disable any other VEX source first. Trigger the rescan.
