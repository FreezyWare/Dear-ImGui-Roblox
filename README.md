# IMGUI Library for Roblox
A simple and customizable UI library for Roblox, inspired by Dear ImGui.
## Getting Started
To get started, you can load the library using the following code:
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FreezyWare/Dear-ImGui-Roblox/main/Main.lua"))()
```
## Creating a UI Library Window
You can create a UI window by calling the **Library.Create** function. Here's an example:
```lua
local Window = Library.Create("My Window", UDim2.new(0, 400, 0, 300))
```
This will create a window titled "My Window" with the specified size.
## Window Flags
The **Library.Create** function also accepts an optional **flags** table to customize the window behavior. The available flags are:
- **NoResize**: Prevents the window from being resized.
- **NoCollapse**: Prevents the window from being collapsed.

Here's an example of creating a window with flags:
```lua
local Window = Library.Create("My Window", UDim2.new(0, 400, 0, 300), {NoResize = true, NoCollapse = false})
```
In this example, the window titled "My Window" cannot be resized, but it can be collapsed.
## Full Example
Here is a full example demonstrating how to load the library, create a window, and use the flags:
```lua
-- Load the library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FreezyWare/Dear-ImGui-Roblox/main/Main.lua"))()

-- Create a window without flags
local Window1 = Library.Create("Default Window", UDim2.new(0, 400, 0, 300))

-- Create a window with `NoResize` flag
local Window2 = Library.Create("No Resize Window", UDim2.new(0, 400, 0, 300), {NoResize = true, NoCollapse = false})

-- Create a window with `NoCollapse` flag
local Window3 = Library.Create("No Collapse Window", UDim2.new(0, 400, 0, 300), {NoResize = false, NoCollapse = true})
```
## Contributing
If you want to contribute to this library, feel free to fork the repository, make your changes, and submit a pull request.
