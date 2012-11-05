DTrace Scripts
==============

Various scripts for use with DTrace(1M)

Scripts
-------

### top-syscalls.d

    ./top-syscalls.d -p pid

Get an idea of the top syscalls for a given pid

### trace-open-read-close.d

    ./trace-open-read-close.d

Experimental script to trace the life-cycle of a file descriptor.  By default,
this script looks at all processes on a given machine, and shows the open,
read, and close calls for a given file.

To Do
- Wrap this with bash to allow specifying a file or PID to trace
- Allow for tracing write(2) calls as well, and maybe mmap(2)

License
-------

MIT
