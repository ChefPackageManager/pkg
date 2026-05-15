# registry
This is the official package registry for the security-focused `chef` package manager.  
All installable packages are JSON and shell-scripts & include instructions on how `chef` should build them, etc.

## For Developers

This section will include general information about writing a package and what a package's responsibilities are and aren't.

So, basically, a package is, in the purest form, a directory in a repository (like this one) within a directory called `packages/`,  
and which includes a `manifest.json` file.

An example of a basic package looks like this:
```
packages/
    python/
       manifest.json
       build.sh
       verify.sh 
    ...
```

---

The `manifest.json` file tells `chef` about the package, such as the name, description and version,  
as well as information about where to download the package and its SHA256 sum used to check for corruption.

The shell-scripts `build.sh`, and `verify.sh` are optional, but if they exist, `chef` will run them during the build
and verification steps, respectively.

`chef` will inject environment variables to these scripts at runtime, and those environment variables are:
* `$CHEF_HOME`: the path where `chef` lives, which should resolve to `~/.chef-package-manager/`.
* `$OS`: the OS which `chef` detected the user to be on, which is either `"LINUX"` or `"MACOS"`.
* more undocumented pieces which will likely change.

When the scripts initially run, `chef` will put their `cwd` to be inside the untarred or unzipped downloaded artifact's
directory.

---

It is the package's responsibility to provide the necessary metadata to initially download its associated artifacts  
and provide build & verification steps for `chef`.
