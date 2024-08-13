CREATE TABLE [users] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [username] nvarchar(255),
  [email] nvarchar(255) UNIQUE,
  [password] nvarchar(255),
  [created_at] datetime2,
  [updated_at] datetime2
)
GO

CREATE TABLE [roles] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] nvarchar(255) UNIQUE,
  [description] nvarchar(max)
)
GO

CREATE TABLE [user_roles] (
  [user_id] int,
  [role_id] int,
  [assigned_at] datetime2,
  PRIMARY KEY ([user_id], [role_id])
)
GO

CREATE TABLE [posts] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [title] nvarchar(255),
  [body] nvarchar(max),
  [user_id] int,
  [status] nvarchar(255),
  [created_at] datetime2,
  [updated_at] datetime2
)
GO

CREATE TABLE [comments] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [post_id] int,
  [user_id] int,
  [content] nvarchar(max),
  [created_at] datetime2
)
GO

CREATE TABLE [likes] (
  [user_id] int,
  [post_id] int,
  [liked_at] datetime2,
  PRIMARY KEY ([user_id], [post_id])
)
GO

CREATE TABLE [follows] (
  [following_user_id] int,
  [followed_user_id] int,
  [created_at] datetime2,
  PRIMARY KEY ([following_user_id], [followed_user_id])
)
GO

CREATE TABLE [categories] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [name] nvarchar(255) UNIQUE,
  [description] nvarchar(max)
)
GO

CREATE TABLE [post_categories] (
  [post_id] int,
  [category_id] int,
  PRIMARY KEY ([post_id], [category_id])
)
GO

CREATE TABLE [profiles] (
  [user_id] int PRIMARY KEY,
  [bio] nvarchar(max),
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
