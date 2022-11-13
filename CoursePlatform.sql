create table "users" (
  "id" uuid primary key,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "role_id" int
);

create table "courses" (
  "id" uuid primary key,
  "title" varchar,
  "description" text,
  "level" varchar,
  "teacher_id" uuid
);

create table "teachers" (
  "id" uuid primary key,
  "name" varchar
);

create table "course_videos" (
  "id" serial primary key,
  "title" varchar,
  "url" varchar,
  "course_id" uuid
);

create table "categories" (
  "id" serial primary key,
  "name" varchar
);

create table "roles" (
  "id" serial primary key,
  "name" varchar
);

create table "users_courses" (
  "id" uuid primary key,
  "user_id" uuid,
  "course_id" uuid,
  "percentage" int,
  "review" text
);

create table "courses_categories" (
  "id" uuid primary key,
  "course_id" uuid,
  "category_id" int
);

alter table "users_courses" add foreign key ("user_id") references "users" ("id");

alter table "users_courses" add foreign key ("course_id") references "courses" ("id");

alter table "users" add foreign key ("role_id") references "roles" ("id");

alter table "courses_categories" add foreign key ("course_id") references "courses" ("id");

alter table "courses_categories" add foreign key ("category_id") references "categories" ("id");

alter table "course_videos" add foreign key ("course_id") references "courses" ("id");

alter table "courses" add foreign key ("teacher_id") references "teachers" ("id");

insert
	into
	categories (name)
values ('frontend'),
('backend');

insert
	into
	teachers (id,
	name)
values ('d73c8cea-af58-4f8c-9c74-581c7249e4ae',
'Ellen Pompeo'),
('348385d7-96ce-4340-a117-dba360f7490d',
'John Wick');

insert
	into
	courses (id,
	title,
	description,
	"level",
	teacher_id)
values ('512e7799-5617-4cb2-b6b6-c79195d46556',
'intro to performance with react',
'learn to use profiler and untangle unnecessary re-renders, also learn the performance enhancing hooks', 
'advanced', 
'348385d7-96ce-4340-a117-dba360f7490d'),
('0027dc98-12aa-45c8-8abd-2bb8267717f9',
'intro to dev ops',
'learn the basics of CI/CD',
'medium',
'd73c8cea-af58-4f8c-9c74-581c7249e4ae');

insert
	into
	course_videos (title,
	url,
	course_id)
values('useCallback',
'https://academlo.com',
'512e7799-5617-4cb2-b6b6-c79195d46556'),
('what is jenkins?',
'https://jenkins.com',
'0027dc98-12aa-45c8-8abd-2bb8267717f9');

insert
	into
	courses_categories (id,
	course_id,
	category_id)
values ('6c376c13-9fe6-4260-a87a-773ff8021892',
'512e7799-5617-4cb2-b6b6-c79195d46556',
1),
('90045eb9-3faa-4528-af71-b3f1345b3543',
'0027dc98-12aa-45c8-8abd-2bb8267717f9',
2);

insert
	into
	roles (name)
values ('student'),
('admin');

insert
	into
	users (id,
	name,
	email,
	password,
	age,
	role_id)
values ('b709fb08-9572-4bd1-bfa7-4b82aa2885a9', 
'Carson Shaw', 
'carson.shaw@gmail.com', 
'cs123', 
'31', 
1),
('065de968-b910-4554-9d32-c395db32f3a2',
'Greta Gill',
'greta.gill@gmail.com',
'gg123',
'33',
2);

insert
	into
	users_courses (id,
	user_id,
	course_id, 
	percentage)
values ('8a65dcd1-e810-4d7c-b890-4b1103cccf72',
'b709fb08-9572-4bd1-bfa7-4b82aa2885a9',
'512e7799-5617-4cb2-b6b6-c79195d46556',
80),
('41291513-0f9d-4e7b-9b21-b2d2cf3c6988',
'b709fb08-9572-4bd1-bfa7-4b82aa2885a9',
'0027dc98-12aa-45c8-8abd-2bb8267717f9',
10);

/* tried to do the optional join but failed */
/* select * from courses as c left join teachers as t, course_videos as cv, courses_categories as cc, users_courses as uc */