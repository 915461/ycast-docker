# YCast

Dockerfile for [milaq/ycast](https://github.com/milaq/YCast).

## Configuration

### Listen addresses

If the user is unable or unwilling to modify the DNS server entries. Sometimes
user would be required to set up own DNS service just to trick the Denon/Yamaha
receiver to engage with YCast instead of now rather defunct service.

There might be another way. Routers may allow to set a static route (or similarly
worded functionality) that essentially route the traffic to a destination through
another gateway. What we do is to declare this Docker container as a gatweway and
then consume the packet destined to *.vtuner.com (or some of them).

For example, Orbi RBR750: Advanced (tab), Advanced (left menu), Static Routes.

| # | Active | Name              | Destination | Gateway      |
|---|--------|-------------------|-------------|--------------|
|	1 | Yes    | denon.vtuner.com  | 8.38.76.252 | 192.168.0.11 |

We must pass every destination address to the container so that it knows it is
meant to consume them.

```sh
YC_ADDRS="8.38.76.252/32 154.27.73.59/32 23.238.108.243/32"
```

If the radio one day stops working, it may just be that DNS entries changed; user
needs to redo the setup in that case. As of late 2025, these addresses are set for
over a decade so the burden on the user is minimal.

To check if the reality still matches the expectations:

```sh
$ ping denon.vtuner.com
PING denon.vtuner.com (8.38.76.252) 56(84) bytes of data.
$ ping denon2.vtuner.com
$ ping denon3.vtuner.com
...
```
