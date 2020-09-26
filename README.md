# atop-docker: Performance monitor Docker image

[_atop_](https://github.com/Atoptool/atop) is a full-screen
performance monitor for Linux that is capable of reporting the
activity of all processes (even if processes have finished during the
interval), daily logging of system and process activity for long-term
analysis, highlighting overloaded system resources by using colors,
etcetera.

[This project](https://github.com/xmartinez/atop-docker) builds a
Docker image including the latest version of _atop_ (v2.5.0).

The Docker image can be used to conveniently run the latest version of
_atop_ on old systems and/or systems where the user does not have full
control over the OS image (e.g., managed Kubernetes nodes).

A typical application is debugging performance issues on production
systems.

## Usage

The following command runs _atop_ in interactive mode:

``` shell
$ docker run --privileged --network=host --pid=host --uts=host --rm -it xmhidalgo/atop
```

Note that this will run _atop_ as root with full access to the host
resources. This is required for _atop_ to properly monitor the host
system and processes.

Additional arguments can be provided and will be passed to the _atop_
process running inside the container:

``` shell
$ alias atop='docker run --privileged --network=host --pid=host --uts=host --rm -it xmhidalgo/atop'
$ atop -V
Version: 2.5.0 - 2020/09/23 03:59:26     <gerlof.langeveld@atoptool.nl>
```

Here, we have defined a `bash` alias as a convenience.
