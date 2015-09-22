# apache-storm Cookbook
=========================
Chef cookbook installs/configures Apache Storm

Requirements
------------

#### packages
- `tar` - cookbook installs tar and two resources for managing remote tar files.

Usage
-----
#### apache-storm::default
To install/configure Apache Storm, just include `apache-storm` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[apache-storm]"
  ]
}
```

