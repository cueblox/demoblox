# DemoBlox

This is an example repository that shows how you can use [CueBlox](https://cueblox.com) to validate and build a JSON file from your dispirate data files; validated with referential integrity.

## Installing Blox

```shell
brew tap cueblox/tap
brew install blox
```

## Validating the Data

Build, with no flags, will ensure that the data within the [data](./data) directory conforms with the [schemata](./schemata).

```shell
blox build
```

### Referential Integrity

CueBlox discoverys any field that ends with `_id` and can validate that the IDs referenced exist on the DataSet. In this example, [albums](./schemata/music.cue) must provide an `artist_id`, which must exist as an ID(slug) within the [artists](./data/artists/) directory.

You can add `--referential-integrity` (or `-i`) to your `blox build`  command to enforce this.
