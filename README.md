This is a docker image designed to test out the [nova-docker][]
compute driver for OpenStack.  It will run an `sshd` service,
permitting you to log in using the ssh public key you provided in
OpenStack.

This image will attempt to provision an ssh `authorized_keys` file for
root from the OpenStack metadata service.

It will also attempt to fetch and execute the user-data script,
assuming that it begins with '#!'.

If you run this image outside of OpenStack, you can add an
`authorized_keys` file as a Docker volume:

   docker run -it --rm \
      -v /tmp/authorized_keys:/root/.ssh/authorized_keys \
      larsks/novassh

Make sure that the `authorized_keys` file is owned by root and has
mode 600.

[nova-docker]: https://wiki.openstack.org/wiki/Docker

