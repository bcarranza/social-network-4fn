-- Tabla Users
INSERT INTO users (username, email, password, created_at, updated_at)
VALUES 
('user1', 'user1@example.com', 'password1', GETDATE(), GETDATE()),
('user2', 'user2@example.com', 'password2', GETDATE(), GETDATE()),
('user3', 'user3@example.com', 'password3', GETDATE(), GETDATE());
GO

-- Tabla Roles
SET IDENTITY_INSERT roles ON;
INSERT INTO roles (id, name, description)
VALUES 
(1, 'Admin', 'Administrator role'),
(2, 'User', 'Regular user role');
SET IDENTITY_INSERT roles OFF;
GO

-- Tabla User_Roles
INSERT INTO user_roles (user_id, role_id, assigned_at)
VALUES 
(1, 1, GETDATE()),
(2, 2, GETDATE());
GO

-- Tabla Posts
SET IDENTITY_INSERT posts ON;
INSERT INTO posts (id, title, body, user_id, status, created_at, updated_at)
VALUES 
(1, 'First Post', 'This is the content of the first post', 1, 'published', GETDATE(), GETDATE()),
(2, 'Second Post', 'This is the content of the second post', 2, 'draft', GETDATE(), GETDATE());
SET IDENTITY_INSERT posts OFF;
GO

-- Tabla Comments
SET IDENTITY_INSERT comments ON;
INSERT INTO comments (id, post_id, user_id, content, created_at)
VALUES 
(1, 1, 2, 'This is a comment on the first post', GETDATE()),
(2, 1, 3, 'Another comment on the first post', GETDATE());
SET IDENTITY_INSERT comments OFF;
GO

-- Tabla Likes
INSERT INTO likes (user_id, post_id, liked_at)
VALUES 
(2, 1, GETDATE()),
(3, 1, GETDATE());
GO

-- Tabla Follows
INSERT INTO follows (following_user_id, followed_user_id, created_at)
VALUES 
(1, 2, GETDATE()),
(2, 3, GETDATE());
GO

-- Tabla Categories
SET IDENTITY_INSERT categories ON;
INSERT INTO categories (id, name, description)
VALUES 
(1, 'Tech', 'Technology related posts'),
(2, 'Life', 'Lifestyle related posts');
SET IDENTITY_INSERT categories OFF;
GO

-- Tabla Post_Categories
INSERT INTO post_categories (post_id, category_id)
VALUES 
(1, 1),
(2, 2);
GO

-- Tabla Profiles
INSERT INTO profiles (user_id, bio, profile_picture, website, location, birthdate)
VALUES 
(1, 'Bio for user 1', 'picture1.png', 'http://user1.com', 'City A', '1990-01-01'),
(2, 'Bio for user 2', 'picture2.png', 'http://user2.com', 'City B', '1992-02-02');
GO



