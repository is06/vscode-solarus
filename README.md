# vscode-solarus

This is not exactly a vscode extension but more like an addon to the most popular Lua extension: **Lua Language Server**.

## Installation

You need to have [Lua Language Server extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) installed to use this addon.

Clone this repository somewhere near your Solarus projects.

```bash
git clone git@github.com:is06/vscode-solarus.git
```

Add a `.vscode/settings.json` (or amend it) with the following properties to add:

(replace <path_to_vscode-solarus> with the real path of course)

```json
{
  "Lua.runtime.version": "LuaJIT",
  "Lua.diagnostics.globals": ["sol"],
  "Lua.workspace.library": ["<path_to_vscode-solarus>/library"]
}
```

This will tell Lua Language Server to define the global table `sol` for your project and have all function definitions available for completion, type hinting and documentation.
