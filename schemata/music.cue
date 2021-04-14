{
    // A Schema definition must exist for the DataSets
    // within this file to be loaded / registered by blox
    // The namespace and name can be anything you want,
    // it helps to keep it unique to you. This will mean
    // a lot more when these are published
    _schema: {
        namespace: "schemata.cueblox.com"
        name: "music"
    }

    // Declare a variable for supportedExtensions
    _supportedExtensions: ["yaml", "md"]

    #Artist: {
        // For blox to realise this is a DataSet, we need to provide
        // a little more metadata
        _dataset: {
            // This plural param doubles as the directory within
            // the data_dir that stores this content / data
            plural: "artists"
            // Which file extensions do you want to load for this DataSet?
            // Currently YAML and Markdown (with frontmatter) is supported
            // and more may be added in the future
            supportedExtensions: _supportedExtensions
        }

        // Now we can actually define our schema
        // The name of the artist, which can be any string value
        name: string

        // Their founded date, which we expect in YYYY format
        // We don't like bands founded before 1900, and we'll
        // cap the upper limit too
        founded: int & >= 1900 & <= 2021

        // Body: all artists can have content that describes them
        body?: string
    }

    #Album: {
        _dataset: {
            plural: "albums"
            supportedExtensions: _supportedExtensions
        }

        name: string
        artist_id: string

        // ISO 8601
        // Cue does offer `time.Time()`, but this isn't exposed
        // via blox (yet)
        released: =~ "[0-9]{4}-[0-9]{2}-[0-9]{2}"
    }
}
