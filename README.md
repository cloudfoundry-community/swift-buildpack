# Heroku buildpack: swift

This is a Heroku buildpack for Swift app, powered by SPM (Swift Package Manager).

Check out the [Curassow-example-helloworld](https://github.com/kylef/Curassow-example-helloworld)
for a fully working example that can be deployed to Heroku.

## Usage

Example usage:

```shell
$ ls
Procfile Project.swift Sources

$ heroku create --buildpack https://github.com/kylef/heroku-buildpack-swift.git

$ git push heroku master
remote: -----> Swift app detected
remote: -----> Installing swift-2.2-SNAPSHOT-2015-12-01-b
remote: -----> Installing clang-3.7.0
remote: -----> Building Package
remote: -----> Copying binaries to 'bin'
```

You can also add it to upcoming builds of an existing application:

```shell
$ heroku buildpacks:set https://github.com/kylef/heroku-buildpack-swift.git
```

The buildpack will detect your app as Swift if it has a `Package.swift` file in
the root.

### Procfile

Using the Procfile, you can set the process to run for your web server. Any
binaries built from your Swift source using SPM will be placed in your $PATH.

```swift
web: HelloWorld --workers 3 --bind 0.0.0.0:$PORT
```

### Specify a Swift version

You can also customise the version of Swift used with a `.swift-version` file
in your repository:

```shell
$ cat .swift-version
swift-2.2-SNAPSHOT-2015-12-01-b
```

**NOTE**: *Since there are frequent Swift language changes, it's advised that
you pin to your Swift version.*
