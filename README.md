# nl_sellshop

A simple sell system for FiveM servers that use ox_inventory.

## Features
- Create as many locations as needed.
- Each location can have a different set of items they buy.
- Option to make job-only sell shops.

## Installation
1. Download the `nl_sellshop` resource.
2. Place the resource folder into your server’s `resources` directory.
3. Add `ensure nl_sellshop` to your `server.cfg`.

## Configuration
- Edit the `config.lua` file to customize the locations and items each shop buys.
- Locations can be added or modified in the configuration file, with the ability to specify job-only access.

## Dependencies
- [ox_inventory](https://github.com/overextended/ox_inventory)
- [ox_lib](https://github.com/overextended/ox_lib)
- [ox_target](https://github.com/overextended/ox_target)

Make sure to install and configure these dependencies for the `nl_sellshop` to function correctly.

## License
This project is licensed under the [GNU General Public License v3.0](LICENSE).
