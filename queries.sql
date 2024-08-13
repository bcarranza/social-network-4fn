/*Aquí tienes algunos ejemplos de consultas importantes utilizando INNER JOIN en el contexto de las tablas que tienes:*/

/*1. Obtener todos los posts con su respectivo autor (usuario)*/
SELECT posts.id, posts.title, posts.body, users.username, users.email
FROM posts
INNER JOIN users ON posts.user_id = users.id;

/*# 2. Listar todos los comentarios con el título del post y el nombre del usuario que hizo el comentario*/
SELECT comments.id, posts.title, comments.content, users.username
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
INNER JOIN users ON comments.user_id = users.id;

/*# 3. Obtener todos los roles asignados a cada usuario*/
SELECT users.username, roles.name AS role_name, user_roles.assigned_at
FROM user_roles
INNER JOIN users ON user_roles.user_id = users.id
INNER JOIN roles ON user_roles.role_id = roles.id;

/*#4. Listar los likes de cada post, con el nombre del usuario que dio el like y el título del post*/
SELECT posts.title, users.username, likes.liked_at
FROM likes
INNER JOIN posts ON likes.post_id = posts.id
INNER JOIN users ON likes.user_id = users.id;

/*#5. Mostrar todos los seguidores y seguidos, junto con los nombres de usuario*/
SELECT f1.username AS follower, f2.username AS followed, follows.created_at
FROM follows
INNER JOIN users AS f1 ON follows.following_user_id = f1.id
INNER JOIN users AS f2 ON follows.followed_user_id = f2.id;

/*#6. Obtener todos los posts con sus categorías respectivas*/
SELECT posts.title, categories.name AS category_name
FROM post_categories
INNER JOIN posts ON post_categories.post_id = posts.id
INNER JOIN categories ON post_categories.category_id = categories.id;

/*#7. Listar los perfiles de usuario junto con la información de usuario (nombre, email)*/
SELECT users.username, users.email, profiles.bio, profiles.website, profiles.location
FROM profiles
INNER JOIN users ON profiles.user_id = users.id;

/*#8. Obtener todos los usuarios que tienen al menos un post, junto con la cantidad de posts que han creado*/
SELECT users.username, COUNT(posts.id) AS post_count
FROM users
INNER JOIN posts ON users.id = posts.user_id
GROUP BY users.username;