CREATE TABLE [users] (
  [id] integer PRIMARY KEY,
  [username] nvarchar(255),
  [email] nvarchar(255) UNIQUE,
  [password] nvarchar(255),
  [created_at] timestamp,
  [updated_at] timestamp
)
GO

CREATE TABLE [roles] (
  [id] integer PRIMARY KEY,
  [name] nvarchar(255) UNIQUE,
  [description] text
)
GO

CREATE TABLE [user_roles] (
  [user_id] integer,
  [role_id] integer,
  [assigned_at] timestamp,
  PRIMARY KEY ([user_id], [role_id])
)
GO

CREATE TABLE [posts] (
  [id] integer PRIMARY KEY,
  [title] nvarchar(255),
  [body] text,
  [user_id] integer,
  [status] nvarchar(255),
  [created_at] timestamp,
  [updated_at] timestamp
)
GO

CREATE TABLE [comments] (
  [id] integer PRIMARY KEY,
  [post_id] integer,
  [user_id] integer,
  [content] text,
  [created_at] timestamp
)
GO

CREATE TABLE [likes] (
  [user_id] integer,
  [post_id] integer,
  [liked_at] timestamp,
  PRIMARY KEY ([user_id], [post_id])
)
GO

CREATE TABLE [follows] (
  [following_user_id] integer,
  [followed_user_id] integer,
  [created_at] timestamp,
  PRIMARY KEY ([following_user_id], [followed_user_id])
)
GO

CREATE TABLE [categories] (
  [id] integer PRIMARY KEY,
  [name] nvarchar(255) UNIQUE,
  [description] text
)
GO

CREATE TABLE [post_categories] (
  [post_id] integer,
  [category_id] integer,
  PRIMARY KEY ([post_id], [category_id])
)
GO

CREATE TABLE [profiles] (
  [user_id] integer PRIMARY KEY,
  [bio] text,
  [profile_picture] nvarchar(255),
  [website] nvarchar(255),
  [location] nvarchar(255),
  [birthdate] date
)
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'Content of the post',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'posts',
@level2type = N'Column', @level2name = 'body';
GO

ALTER TABLE [posts] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [comments] ADD FOREIGN KEY ([post_id]) REFERENCES [posts] ([id])
GO

ALTER TABLE [comments] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [likes] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [likes] ADD FOREIGN KEY ([post_id]) REFERENCES [posts] ([id])
GO

ALTER TABLE [follows] ADD FOREIGN KEY ([following_user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [follows] ADD FOREIGN KEY ([followed_user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [user_roles] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [user_roles] ADD FOREIGN KEY ([role_id]) REFERENCES [roles] ([id])
GO

ALTER TABLE [post_categories] ADD FOREIGN KEY ([post_id]) REFERENCES [posts] ([id])
GO

ALTER TABLE [post_categories] ADD FOREIGN KEY ([category_id]) REFERENCES [categories] ([id])
GO

ALTER TABLE [profiles] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO
