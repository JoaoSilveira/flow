pub const mode = struct {
    pub const mini = struct {
        pub const goto = @import("goto.zig");
        pub const move_to_char = @import("move_to_char.zig");
        pub const file_browser = @import("file_browser.zig");
        pub const find_in_files = @import("find_in_files.zig");
    };
};

pub const Mode = struct {
    handler: EventHandler,
    name: []const u8 = "",
    line_numbers: enum { absolute, relative } = .absolute,
    keybind_hints: ?*const KeybindHints = null,
    cursor_shape: renderer.CursorShape = .block,

    pub fn deinit(self: *Mode) void {
        self.handler.deinit();
    }
};

pub const KeybindHints = std.static_string_map.StaticStringMap([]const u8);

const renderer = @import("renderer");
const EventHandler = @import("EventHandler");
const std = @import("std");