-- Tabla Users
INSERT INTO users (id, username, email, password, created_at, updated_at)
VALUES 
(1, 'user1', 'user1@example.com', 'password1', GETDATE(), GETDATE()),
(2, 'user2', 'user2@example.com', 'password2', GETDATE(), GETDATE()),
(3, 'user3', 'user3@example.com', 'password3', GETDATE(), GETDATE());

-- Tabla Roles
INSERT INTO roles (id, name, description)
VALUES 
(1, 'Admin', 'Administrator role'),
(2, 'User', 'Regular user role');

-- Tabla User_Roles
INSERT INTO user_roles (user_id, role_id, assigned_at)
VALUES 
(1, 1, GETDATE()),
(2, 2, GETDATE());

-- Tabla Posts
INSERT INTO posts (id, title, body, user_id, status, created_at, updated_at)
VALUES 
(1, 'First Post', 'This is the content of the first post', 1, 'published', GETDATE(), GETDATE()),
(2, 'Second Post', 'This is the content of the second post', 2, 'draft', GETDATE(), GETDATE());

-- Tabla Comments
INSERT INTO comments (id, post_id, user_id, content, created_at)
VALUES 
(1, 1, 2, 'This is a comment on the first post', GETDATE()),
(2, 1, 3, 'Another comment on the first post', GETDATE());

-- Tabla Likes
INSERT INTO likes (user_id, post_id, liked_at)
VALUES 
(2, 1, GETDATE()),
(3, 1, GETDATE());

-- Tabla Follows
INSERT INTO follows (following_user_id, followed_user_id, created_at)
VALUES 
(1, 2, GETDATE()),
(2, 3, GETDATE());

-- Tabla Categories
INSERT INTO categories (id, name, description)
VALUES 
(1, 'Tech', 'Technology related posts'),
(2, 'Life', 'Lifestyle related posts');

-- Tabla Post_Categories
INSERT INTO post_categories (post_id, category_id)
VALUES 
(1, 1),
(2, 2);

-- Tabla Profiles
INSERT INTO profiles (user_id, bio, profile_picture, website, location, birthdate)
VALUES 
(1, 'Bio for user 1', 'picture1.png', 'http://user1.com', 'City A', '1990-01-01'),
(2, 'Bio for user 2', 'picture2.png', 'http://user2.com', 'City B', '1992-02-02');
