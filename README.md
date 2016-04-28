(**PLEASE NOTE THIS IS WORK IN PROGRESS / NOT READY TO BE USED YET**)
(**DOCUMENTATION AND CODE IS STILL IN PROGRESS**)
Bluemix buildpack for Swift
=======================================

This is the Bluemix buildpack for Swift applications, powered by the Swift Package Manager (SPM). Though develop mainly for Bluemix, this buildpack can be used on any Cloud Foundry environment. Administrators can upload an online (fetch assets from Internet) or offline (is bundled with buildpack assets) variation.

Check out [Kitura-Sample](https://github.com/IBM-Swift/Kitura-Sample), a Kitura-based application that can be deployed to Bluemix.

Usage
-----

Example usage:

```shell
$ ls
Procfile Project.swift Sources

$ cf push -b https://github.com/cloudfoundry-community/swift-buildpack.git
-----> Downloaded app package (4.0K)
-----> Downloaded app buildpack cache (171M)
-----> Buildpack version 1.0.0
-----> Installing Swift 2.2-SNAPSHOT-2016-01-11-a
       Downloaded Swift
-----> Installing Clang 3.7.0
       Downloaded Clang
-----> Building Package
       Cloning Packages/Curassow
       Cloning Packages/Nest
       Cloning Packages/Inquiline
       Cloning Packages/Commander
       Compiling Swift Module 'Nest' (1 sources)
       Linking Library:  .build/release/Nest.a
       Compiling Swift Module 'Inquiline' (3 sources)
       Linking Library:  .build/release/Inquiline.a
       Compiling Swift Module 'Commander' (8 sources)
       Linking Library:  .build/release/Commander.a
       Compiling Swift Module 'Curassow' (7 sources)
       Linking Library:  .build/release/Curassow.a
       Compiling Swift Module 'HelloWorld' (1 sources)
       Linking Executable:  .build/release/HelloWorld
-----> Copying dynamic libraries
-----> Copying binaries to 'bin'
```

The buildpack will detect your app as Swift if it has a `Package.swift` file in the root.

### Procfile

Using the `Procfile`, you can set the process to run for your web server. Any binaries built from your Swift source using SPM will be placed in your $PATH.

```swift
web: HelloWorld --workers 3 --bind 0.0.0.0:$PORT
```

### Swift-cfenv


### Specify a Swift version

You can also customise the version of Swift used with a `.swift-version` file in your repository:

```shell
$ cat .swift-version
2.2-SNAPSHOT-2016-01-11-a
```

See [manifest.yml](https://github.com/IBM-Swift/swift-buildpack/blob/bluemix-buildpack/manifest.yml) for supported versions.

**NOTE**: *Since there are frequent Swift language changes, it's advised that you pin to your Swift version.*

### libdispatch
Only the following versions of the Swift binaries have libsdispath.

### Debugging

If the buildpack preparation or compilation steps are failing then you can enable some debugging:

```
cf set-env <appname> BP_DEBUG 1
```

To deactivate:

```
cf unset-env <appname> BP_DEBUG
```

Admin installation
------------------

```
wget https://github.com/cloudfoundry-community/swift-buildpack/releases/download/v1.0.0/swift_buildpack-cached-v1.0.0.zip
cf create-buildpack swift_buildpack swift_buildpack*.zip 10
```

Or to update:

```
wget https://github.com/cloudfoundry-community/swift-buildpack/releases/download/v1.0.0/swift_buildpack-cached-v1.0.0.zip
cf update-buildpack swift_buildpack -p swift_buildpack*.zip
```

Packaging
---------

The two buildpack zip files are built from two different `manifest.yml` files:

```
BUNDLE_GEMFILE=cf.Gemfile bundle install
BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager --uncached --use-custom-manifest manifest.yml
BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager --cached --use-custom-manifest manifest-cached.yml
```
