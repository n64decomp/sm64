# Custom Functionality

## Redirection
IDO recomp currently has two forms of path redirection, both involving the `/usr` folder.

### `/usr/lib`
In order for users to not having to worry about installing the binaries in particular locations in `/usr/lib`, recomp automatically redirects `/usr/lib/` paths. This is done by determining the location of `cc` and redirecting to the same directory. This does mean all the binaries and `err.english.cc` are expected to be a part of a single flattened directory.

It is also possible to override the auto redirect by using the environment variable `USR_LIB` with the desired redirection path. This can be used if the binaries are not in a flattened directory with `cc` or if on Linux and are unable to read `/proc/self/exe`.

Wrapper functions implementing this redirection:
* `init_file`
* `wrapper_execvp`

### /usr/include
The other form of redirection is completely optional and is done by setting the environment variable `USR_INCLUDE` to the desired redirection path. This will than redirect all opened files files there. This is done so that the `mdebug` section file paths will still use `/usr/include` path, but the files themselves can be located elsewhere for greater flexibility.

Wrapper functions implementing this redirection:
* `wrapper_open`
