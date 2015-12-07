Heroku buildpack: swift
=======================

This is a Cloud Foundry/Heroku buildpack for Swift app, powered by SPM (Swift Package Manager). It can be used on any Cloud Foundry, and administrators can upload an online (fetch assets from Internet) or offline (is bundled with buildpack assets) variation.

Check out a [helloworld](https://github.com/kylef/Curassow-example-helloworld) for a fully working example that can be deployed to any Cloud Foundry.

Usage
-----

Example usage:

```shell
$ ls
Procfile Project.swift Sources

$ cf push -b https://github.com/cloudfoundry-community/swift-buildpack.git
-----> Swift app detected
-----> Installing swift-2.2-SNAPSHOT-2015-12-01-b
-----> Installing clang-3.7.0
-----> Building Package
-----> Copying binaries to 'bin'
```

The buildpack will detect your app as Swift if it has a `Package.swift` file in the root.

### Procfile

Using the `Procfile`, you can set the process to run for your web server. Any binaries built from your Swift source using SPM will be placed in your $PATH.

```swift
web: HelloWorld --workers 3 --bind 0.0.0.0:$PORT
```

### Specify a Swift version

You can also customise the version of Swift used with a `.swift-version` file in your repository:

```shell
$ cat .swift-version
swift-2.2-SNAPSHOT-2015-12-01-b
```

**NOTE**: *Since there are frequent Swift language changes, it's advised that you pin to your Swift version.*

### Debugging

If the buildpack preparation or compilation steps are failing then you can enable some debugging:

```
cf set-env <appname> BP_DEBUG 1
```

To deactivate:

```
cf unset-env <appname> BP_DEBUG
```

Packaging
---------

```
BUNDLE_GEMFILE=cf.Gemfile bundle install
BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager --uncached
BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager --cached
```
