params [];

west setFriend [east, 0];
resistance setFriend [east, 0];
west setFriend [resistance, 0];
east setFriend [west, 0];
east setFriend [resistance, 0];
resistance setFriend [west, 0];